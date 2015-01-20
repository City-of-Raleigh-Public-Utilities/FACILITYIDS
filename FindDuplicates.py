
import arcpy
import os, sys
import logging
import multiprocessing
from colorama import init
from colorama import Fore, Back, Style

arcpy.env.overwriteOutput = True
# arcpy.env.workspace = os.path.join(os.path.dirname(sys.argv[0]), 'RPUD.sde')
arcpy.env.workspace = 'Database Connections\\WHITEC.sde'
init(autoreset=True)
datasetList = ["RPUD.SewerCollectionNetwork","RPUD.WaterDistributionNetwork"]
logging.basicConfig(filename=os.path.join(os.path.dirname(sys.argv[0]),'duplicates.log'),level=logging.INFO, format='%(asctime)s %(message)s')

# datasetList = ["RPUD.WaterDistributionNetwork"]
def getArguments (datasetList):
    arguments = []
    for dataset in datasetList:
        featureClass = arcpy.ListFeatureClasses('','',dataset)
        for f in featureClass:
            arguments.append(f)
    print '%d Argument Created...\n' % len(arguments)
    return arguments


def findDuplicateFacilityIDs(infeature):
    try:
        print 'Finding Duplicates in %s' % infeature
        out_folder_path = os.path.join(os.path.dirname(sys.argv[0]), 'data')
        name = infeature[5:] + '.dbf'
        output = os.path.join(out_folder_path, name)
        arcpy.FindIdentical_management(infeature, output, "FACILITYID", "", "0", "ONLY_DUPLICATES")
        print(Fore.BLUE + '%s duplicates table created' % infeature)
    except:
        print(Fore.RED + 'FACILITYID does not exisit in %s' % infeature)
        pass
        #print arcpy.GetMessages(2)

def getJoinTables ():
    joinTables = []
    print '\n'
    print(Fore.WHITE + '+' * 100 + '\n')
    #Switch Workspace to duplicates file geodatabase
    arcpy.env.workspace = os.path.join(os.path.dirname(sys.argv[0]), 'data')
    print(Fore.YELLOW + 'Workspace changed to %s \n' % arcpy.env.workspace)
    duplicate_features = arcpy.ListTables()
    for dupFeature in duplicate_features:
        count = int(arcpy.GetCount_management(dupFeature).getOutput(0))
        print '%s has %d duplicates' % (dupFeature, count)
        logging.warning('%s has %d duplicates' % (dupFeature, count))
        if count > 0:
            joinTables.append(dupFeature)
    #Return to orginial workspace
    # arcpy.env.workspace = os.path.join(os.path.dirname(sys.argv[0]), 'RPUD.sde')
    arcpy.env.workspace = 'Database Connections\\WHITEC.sde'
    print(Fore.YELLOW + '\nWorkspace returned to %s \n' % arcpy.env.workspace)
    print(Fore.WHITE + '+' * 100)
    return joinTables


def turnOffEditorTracking(feature_class):
    arcpy.DisableEditorTracking_management(feature_class)
    print(Fore.YELLOW + 'Editor Tracking Disabled on %s' % feature_class)

def enableEditorTarcking(feature_class):
    arcpy.EnableEditorTracking_management(feature_class, 'CREATEDBY', 'CREATEDON', 'EDITEDBY', 'EDITEDON', 'NO_ADD_FIELDS')
    print(Fore.YELLOW + 'Editor Tracking Enabled on %s' % feature_class)

##Original function
# def removeDuplicates(duptable):
#
#     infeature = 'RPUD.' + duptable.split('.')[0]
#     print 'Removeing Duplicates in %s' % infeature
#     changes = 0
#     fields = ['OID@','FACILITYID']
#     duptable = os.path.join(os.path.dirname(sys.argv[0]), duptable)
#     try:
#         edit = arcpy.da.Editor(arcpy.env.workspace)
#         turnOffEditorTracking(infeature)
#         arcpy.MakeFeatureLayer_management(infeature, "feature")
#         arcpy.MakeTableView_management(duptable, "table")
#         edit.startEditing(False, True)
#         edit.startOperation()
#         with arcpy.da.SearchCursor("table", "IN_FID") as search:
#             for srow in search:
#                 in_fid = srow[0]
#                 with arcpy.da.UpdateCursor("feature", fields , 'OBJECTID = %s' % in_fid) as updateCursor:
#                     for row in updateCursor:
#                         if row[1] != None:
#                             row[1] = None
#                             updateCursor.updateRow(row)
#                             changes+=1
#         print(Fore.BLUE + "%d changes made to %s" % (changes, infeature))
#         logging.warning("%d changes made to %s" % (changes, infeature))
#         edit.stopOperation()
#         edit.stopEditing(True)
#         enableEditorTarcking(infeature)
#     except RuntimeError:
#         print(Fore.RED + arcpy.GetMessages())
#         pass
#     except:
#         edit.stopEditing(True)
#         enableEditorTarcking(infeature)
#         print arcpy.GetMessages()
#         print(Fore.RED + "Error, removeDuplicates failed")

def removeDuplicates(duptable):
    #Gets the feature name from the table name by removing file extesion and adding RPUD to the beginning (ex. RPUD.ssGravityMains)
    infeature = 'RPUD.' + duptable.split('.')[0]
    #Gets the table name without the file extension (ex. ssGravityMains)
    intableName = duptable.split('.')[0]
    print 'Removeing Duplicates in %s' % infeature
    #Placeholder that will count the number of changes to a feature class, is also used in logic structure to determine the first record in a selection
    changes = 0
    fields = [infeature + '.FACILITYID']
    #Full path to duplicate tables
    duptable = os.path.join(os.path.dirname(sys.argv[0]), os.path.join('data', duptable))
    try:
        edit = arcpy.da.Editor(arcpy.env.workspace)
        turnOffEditorTracking(infeature)

        #Sets up environment by creating a feature layer and table view and inner joining the record sets
        arcpy.MakeFeatureLayer_management(infeature, "feature")
        arcpy.MakeTableView_management(duptable, "table")
        join = arcpy.AddJoin_management( "feature", "OBJECTID", "table", "IN_FID", "KEEP_COMMON")

        #Starts edit session
        edit.startEditing(False, True)
        edit.startOperation()
        joinName = "%s.FACILITYID" % infeature
        with arcpy.da.SearchCursor(join, fields, joinName + " IS NOT NULL", sql_clause=("DISTINCT", None)) as search:
          unique = set(search)
          for srow in unique:
              facilityid = str(srow[0])
              print "%s %s" % (facilityid, type(facilityid))

                # result = arcpy.SelectLayerByAttribute_management ('feature', "NEW_SELECTION",  joinName + " =  '" + facilityid + "'")
                # seletionCount = int(arcpy.GetCount_management(result).getOutput(0))
                # print seletionCount
              updateOptions = {
                  'in_table': infeature,
                  'fields': ['%s.FACILITYID', "%s.EDITEDON"] % (infeature, infeature),
                  'where_clause': joinName + " =  '" + facilityid + "'",
                  'sql_clause': (None, "ORDER BY EDITEDON ASC")
              }

              with arcpy.da.UpdateCursor(updateOptions['in_table'], updateOptions['fields'], updateOptions['where_clause'], sql_clause=updateOptions['sql_clause']) as updateCursor:
                  for row in updateCursor:
                        if changes != 0:
                            print "Original: %s %s" % (row[0], row[1])
                            # updateCursor.updateRow(row)
                            changes+=1
                        else:
                            print "Duplicate: %s %s" % (row[0], row[1])
                            row[0] = None
                            changes+=1
        print(Fore.BLUE + "%d changes made to %s" % (changes, infeature))
        logging.warning("%d changes made to %s" % (changes, infeature))
        edit.stopOperation()
        edit.stopEditing(True)
        enableEditorTarcking(infeature)
    except RuntimeError:
        print(Fore.RED + arcpy.GetMessages())
        pass
    except:
        edit.stopEditing(True)
        enableEditorTarcking(infeature)
        print arcpy.GetMessages()
        print(Fore.RED + "Error, removeDuplicates failed")


def main():
    # logging.warning('-- Last Started.')
    # data = getArguments(datasetList)
    # pool = multiprocessing.Pool(10)
    # pool.map_async(findDuplicateFacilityIDs, data)
    # pool.close()
    # pool.join()
    joinList = getJoinTables()
    for each in joinList:
        removeDuplicates(each)


    logging.warning('End of Update')

if __name__ == '__main__':
    main()
