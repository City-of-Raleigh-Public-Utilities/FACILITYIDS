# INSTALLATION INSTRUCTIONS:
#
# Running under Windows 7, use the "Task Scheduler" to schedule this script
# to run at night (it currently runs at 9:00PM).  The scheduler calls a DOS
# batch script which in turn runs this python script.  The batch script is used
# to redirect the messages to a log file as follows:
#
# .\AUTOID.py >> autoid.log  2>&1
#
# -----------------------------------------------------------------------------


# Import system modules
import arcpy
# Import system modules
import math, sys, string, os, time, shutil, re
import logging

arcpy.env.overwriteOutput = True

logging.basicConfig(filename=os.path.join(os.path.dirname(sys.argv[0]),'updates.log'),level=logging.INFO, format='%(asctime)s %(message)s')
arcpy.env.workspace = "Database Connections/RPUD_TRANSDB.sde"
# these message go to standard output.
def LogMessage( message ):
    print time.strftime("%Y-%m-%dT%H:%M:%S ", time.localtime()) + message
    logging.warning(message)
    return



#
#
#
def turnOffEditorTracking(feature_class):
    arcpy.DisableEditorTracking_management(feature_class)
def enableEditorTarcking(feature_class):
    arcpy.EnableEditorTracking_management(feature_class, 'CREATEDBY', 'CREATEDON', 'EDITEDBY', 'EDITEDON', 'NO_ADD_FIELDS')

#Selects features that are not null and not in the 900000 block of facility id
def UpdateFACILITYID(fc, layerName, whereClause="FACILITYID IS NOT NULL AND FACILITYID NOT LIKE '___9%' AND FACILITYID NOT LIKE '____9%'"):

    LogMessage("Updating IDs for " + fc)
    arcpy.DisableEditorTracking_management(fc)
    LogMessage(fc + ' Editor Tracking Disabled')
    arcpy.MakeFeatureLayer_management(fc, layerName)
    # arcpy.ChangeVersion_management(layerName, "TRANSACTIONAL", "SDE." + versionName, "")

    #result = int(arcpy.GetCount_management(layerName).getOutput(0))
    #print result
    i = 0
    maxId = ""

    # Find the max value here, if we get nothing then quit.
    rows = arcpy.SearchCursor(layerName, whereClause, "", "", "FACILITYID D")
    row = rows.next()

    if row == None :
        LogMessage("No valid maximum FACILITYID found.  Canceling update.")
        # arcpy.ChangeVersion_management(layerName, "TRANSACTIONAL", "PUBLICWORKS.AUTOIDX", "")
        del rows
        del row
        return

    maxId = row.getValue("FACILITYID")
    LogMessage("MAX ID = " +  str(maxId))
    # convert the id to an integer
    match = re.match(r"([a-z]+)([0-9]+)", maxId, re.I)
    if match:
        items = match.groups()
        newId = int(items[1]) + 1
        prefix = items[0]
    #Start Editing Session
    edit = arcpy.da.Editor(arcpy.env.workspace)
    edit.startEditing(False, True)
    edit.startOperation()
    # Create update cursor for feature class, only for those features whose FACILITYID is NULL.
    rows = arcpy.UpdateCursor(layerName, "FACILITYID IS NULL")
    #rows = arcpy.SearchCursor(layerName, "FACILITYID IS NULL")

    featureCount = 0

    # Now update the FACILITYIDs for those features...
    for row in rows:
        # TODO:  maybe we should output the OBJECTID in the log file too...
        print newId

        if newId < 10:
            row.FACILITYID = prefix + "0000" + str(newId)
        elif newId < 100:
            row.FACILITYID = prefix + "000" + str(newId)
        elif newId < 1000:
            row.FACILITYID = prefix + "00" + str(newId)
        elif newId < 10000:
            row.FACILITYID = prefix + "0" + str(newId)
        else:
            row.FACILITYID = prefix + str(newId)

        rows.updateRow(row)
        featureCount = featureCount + 1
        newId = newId + 1

    edit.stopOperation()
    LogMessage("Features updated = " + str(featureCount))

    #
    # Delete cursor and row objects to remove locks on the data
    #
    del row
    del rows

    #Stops Editing Session

    edit.stopEditing(True)

    # We have to change the version to some other version otherwise we cannot delete the
    # "AUTOID_YYYYMMDD" version.  This is a workaround to handle to possiblity of
    # not being able to switch to DEFAULT.  This is likely a bug in the "ChangeVersion"
    # tool.
    enableEditorTarcking(fc)
    LogMessage(fc + ' Editor Tracking Enabled')
    # arcpy.ChangeVersion_management(layerName, "TRANSACTIONAL", "PUBLICWORKS.AUTOIDX", "")
    return


#
#
def UpdateMHNumbers(mainsfc, mhsfc):

    #Truns off Editor Tracking
    turnOffEditorTracking(mainsfc)
    turnOffEditorTracking(mhsfc)
    LogMessage(mainsfc + ' Editor Tracking Disabled')
    LogMessage(mhsfc + ' Editor Tracking Disabled')
    mainsLayer = "mainsLayer"
    mhsLayer = "mhsLayer"

    arcpy.MakeFeatureLayer_management(mainsfc, "mainsLayer")
    arcpy.MakeFeatureLayer_management(mhsfc, "mhsLayer")


    # find all the gravity mains that have FROMH = NULL OR TOHM = NULL
    # create a cursor on these (SIMULATE WITH OBJECTID LESS THAN 10
    # we could just make a list of objectids...
    LogMessage("UpdateMHNumbers")

    arcpy.SelectLayerByAttribute_management(mainsLayer, "CLEAR_SELECTION")

    # select only gravity mains with a FROMMH and TOMH equal to <NULL>
    rows = arcpy.UpdateCursor(mainsLayer, "FROMMH IS NULL AND TOMH IS NULL")
    featureCount = 0

    for row in rows:

        featureCount = featureCount + 1
        # grab the geometry of the main, we might need it later
        maingeom = row.getValue("SHAPE")
        mainOID = row.getValue("OBJECTID")

        # select only a single main from our subset.  once selected use it to locate any intersecting
        # manholes.  these should be the manholes at either end of the main.
        # we would rather use the geomtric network but there is no way to get to it from
        # python.
        try:
            arcpy.SelectLayerByAttribute_management(mainsLayer, "CLEAR_SELECTION")
            arcpy.SelectLayerByAttribute_management(mainsLayer, "NEW_SELECTION", "OBJECTID = {0}".format(mainOID))
            arcpy.SelectLayerByLocation_management(mhsLayer, "INTERSECT", mainsLayer)
        except:
            print arcpy.getMessage(2)



        mhrows = arcpy.SearchCursor(mhsLayer)
        mhcount = int(arcpy.GetCount_management(mhsLayer).getOutput(0))


        # if we have two manhole features, then proceed to determine which one is on the
        # upstream end of the main.
        if mhcount == 2:
            mhrow = mhrows.next()
            mhgeom = mhrow.getValue("SHAPE")
            x = mhgeom.firstPoint.X
            y = mhgeom.firstPoint.Y
            #print mhrow1.getValue("FACILITYID")
            id1 = mhrow.getValue("FACILITYID")

            HPE1 = mhrow.getValue('SURCHARGEELEV')

            IE1 = mhrow.getValue('INVERTELEV')

            mhrow = mhrows.next()
            #print mhrow2.getValue("FACILITYID")
            id2 = mhrow.getValue("FACILITYID")

            HPE2 = mhrow.getValue('SURCHARGEELEV')

            IE2 = mhrow.getValue('INVERTELEV')

            #mhgeom1 = mhrow1.getValue("SHAPE")


            # use a distance to determine which manhole is on the upstream end of the main.
            if distance(maingeom.firstPoint.X, maingeom.firstPoint.Y, x, y) < 1.0:
                #print id1 + ":" + id2
                upstreamID = id1
                downstreamID = id2
                upelev = IE1
                downelev = HPE2
                print id1 + ":" + id2


            else:
                #print mhrow2.getValue("FACILITYID")
                upstreamID = id2
                downstreamID = id1
                upelev = IE2
                downelev = HPE1


            row.FROMMH = upstreamID
            row.TOMH = downstreamID
            row.UPELEV = upelev
            row.DOWNELEV = downelev

            #Calculate Slope
            y2 = row.getValue('UPELEV')
            y1 = row.getValue('DOWNELEV')
            xdelta = row.getValue('SHAPE.LEN')

            if y2 > 0 and y1 > 0:
                slope = ((y2- y1)/(xdelta))*100
                LogMessage('Slope:' + str(slope))
                row.Slope = slope

            rows.updateRow(row)

            LogMessage(str(mainOID) + "  =  " + str(upstreamID) + " : " + str(downstreamID))


    #
    # Delete cursor and row objects to remove locks on the data
    #
    del row
    del rows

    #Turns Editor Tracking Back on
    enableEditorTarcking(mainsfc)
    enableEditorTarcking(mhsfc)
    LogMessage(mainsfc + ' Editor Tracking Enabled')
    LogMessage(mhsfc + ' Editor Tracking Enabled')

    return


def distance(fromX, fromY, toX, toY):
    distX = toX - fromX
    #print distX
    distY = toY - fromY
    #print distY
    dist = math.sqrt( (distX * distX) + (distY * distY) )
    #print dist
    return dist

##
## MAIN
##

# Local Variables
# get todays date in YYYYMMDD format
today=time.strftime("%Y%m%d", time.localtime())


LogMessage("")
LogMessage("********  START OF AUTOID.py  **********")

# #
# # Sewer
# #
# UpdateFACILITYID("RPUD.ssCleanOut", "ssCleanOuts1")
# UpdateFACILITYID("RPUD.ssSystemValve", "ssSystemValve1")
# UpdateFACILITYID("RPUD.ssControlValve", "ssControlValves1")
# UpdateFACILITYID("RPUD.ssFitting", "ssFittings1")
# UpdateFACILITYID("RPUD.ssForceMain", "ssForceMains1")
# UpdateFACILITYID("RPUD.ssGravityMain", "ssGravityMains1")
# UpdateFACILITYID("RPUD.ssLateralLine", "ssLateralLines1")
# UpdateFACILITYID("RPUD.ssAerial", "ssAerials1")
# UpdateFACILITYID("RPUD.ssSystemValve", "ssSystemValve1")
# UpdateFACILITYID("RPUD.ssGreaseTrap", "ssGreaseTrap1")
# UpdateFACILITYID("RPUD.ssNetworkStructure", "ssNetworkStructure1")
# UpdateFACILITYID("RPUD.ssCasing", "ssCasing1")



# # # # #

# UpdateFACILITYID("RPUD.ssManhole", "ssManholes1")
# UpdateMHNumbers("RPUD.ssGravityMain","RPUD.ssManhole")



# #
# # Water
# #
# UpdateFACILITYID("RPUD.wControlValve", "wControlValves1")
# UpdateFACILITYID("RPUD.wFitting", "wFittings1")
# UpdateFACILITYID("RPUD.wGravityMain", "wGravityMains1")
# UpdateFACILITYID("RPUD.wLateralLine", "wLateralLines1")
# UpdateFACILITYID("RPUD.wServiceConnection", "wServiceConnections1")
# UpdateFACILITYID("RPUD.wSystemValve", "wSystemValves1")
# UpdateFACILITYID("RPUD.wPressureMain", "wPressureMains1")
UpdateFACILITYID("RPUD.wHydrant", "wHydrants1")
UpdateFACILITYID("RPUD.wSamplingStation", "wSamplingStations1")
UpdateFACILITYID("RPUD.wCasing", "wCasing1")
UpdateFACILITYID("RPUD.wNetworkStructure", "wNetworkStructure1")

# #Reuse
# UpdateFACILITYID("RPUD.rCasing", "rCasing1")
# UpdateFACILITYID("RPUD.rControlValve", "rControlValve1")
UpdateFACILITYID("RPUD.rFitting", "rFitting1")
# UpdateFACILITYID("RPUD.rHydrant", "rHydrant1")
UpdateFACILITYID("RPUD.rLateralLine", "rLateralLine1")
# UpdateFACILITYID("RPUD.rNetworkStructure", "rNetworkStructure1")
UpdateFACILITYID("RPUD.rPressureMain", "rPressureMain1")
UpdateFACILITYID("RPUD.rSamplingStation", "rSamplingStation1")
# UpdateFACILITYID("RPUD.rServiceConnection", "rServiceConnection")
# UpdateFACILITYID("RPUD.rSystemValve", "rSystemValve1")

#PU_Boundaries

# UpdateFACILITYID("RPUD.EasementMaintenanceAreas", "emas")

LogMessage("********  STOP OF AUTOID.py  **********")
LogMessage("")
