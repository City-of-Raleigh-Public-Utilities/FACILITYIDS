#Use this script to update sequence.sql after running AutoID.py or after creating any FacilityID not using a trigger


import arcpy, os, sys, re

arcpy.env.overwriteOutpu = True
workspace = "Database Connections/RPUD_TRANSDB.sde"

arcpy.env.workspace = workspace
#output sql file
sqlFile = "sequences.sql"

#sewer sequence names
ssDict = {
	'RPUD.ssAerial': 'ssAerial_seq',
	'RPUD.ssCasing': 'ssCasing_seq',
	'RPUD.ssCleanout': 'ssCleanout_seq',
	'RPUD.ssControlValve': "ssControlValve_seq",
	'RPUD.ssFitting': "ssFitting_seq",
	'RPUD.ssForceMain': "ssForceMain_seq",
	'RPUD.ssGravityMain': "ssGravityMain_seq",
	'RPUD.ssGreaseTrap': "ssGreaseTrap_seq",
	'RPUD.ssLateralLine': "ssLateralLine_seq",
	'RPUD.ssManhole': "ssManhole_seq",
	'RPUD.ssNetworkStructure': "ssNetworkStructure_seq",
	'RPUD.ssSystemValve': "ssSystemValve_seq"}
#water sequence names
wDict = {
	'RPUD.wCasing': "wCasing_seq",
	'RPUD.wControlValve': "wControlValve_seq",
	'RPUD.wFitting': "wFitting_seq",
	'RPUD.wGravityMain': "wGravityMain_seq",
	'RPUD.wHydrant': "wHydrant_seq",
	'RPUD.wLateralLine': "wLateralLine_seq",
	'RPUD.wNetworkStructure': "wNetworkStructure_seq",
	'RPUD.wPressureMain': "wPressureMain_seq",
	'RPUD.wSamplingStation': "wSampleStation_seq",
	'RPUD.wServiceConnection': "wServiceConnection_seq",
	'RPUD.wSystemValve': "wSystemValve_seq"}

rDict = {
	'RPUD.rCasing': "rCasing_seq",
	'RPUD.rControlValve': "rControlValve_seq",
	'RPUD.rFitting': "rFitting_seq",
	'RPUD.rHydrant': "rHydrant_seq",
	'RPUD.rLateralLine': "rLateralLine_seq",
	'RPUD.rNetworkStructure': "rNetworkStructure_seq",
	'RPUD.rPressureMain': "rPressureMain_seq",
	'RPUD.rSamplingStation': "rSampleStation_seq",
	'RPUD.rServiceConnection': "rServiceConnection_seq",
	'RPUD.rSystemValve': "rSystemValve_seq"}

#find the current max number and update sequence with the next number
def updateSeq(fc, seq, lyr, whereClause = "FACILITYID IS NOT NULL AND FACILITYID NOT LIKE '___9%' AND FACILITYID NOT LIKE '____9%'"):
	arcpy.MakeFeatureLayer_management(fc, lyr)
	rows = arcpy.SearchCursor(lyr, whereClause, "", "", "FACILITYID D")
	row = rows.next()
	if row == None:
		del rows
		del row
		line = "\nDROP SEQUENCE {};\n".format(seq)
		line += "\nCREATE SEQUENCE {0}\n START WITH     {1}\n INCREMENT BY   1;".format(seq, 1)
		line += "\n\n---------------------------------------------------------------------------------------\n"
		return line
	maxID = row.getValue("FACILITYID")
	match = re.match(r"([a-z]+)([0-9]+)", maxID, re.I)
	if match:
		items = match.groups()
		newID = int(items[1]) + 1
		line = "\nDROP SEQUENCE {};\n".format(seq)
		line += "\nCREATE SEQUENCE {0}\n START WITH     {1}\n INCREMENT BY   1;".format(seq, newID)
		line += "\n\n---------------------------------------------------------------------------------------\n"
		print line
	del rows
	del row
	return line
#write out to sql file
with open(sqlFile, "wb") as fo:
	fo.write("--Sewer--------------------------------------------------------------------------------\n---------------------------------------------------------------------------------------\n")
	for key, value in ssDict.iteritems():
		fo.write(updateSeq(key, value, str(key) + "1"))
	fo.write("--Water--------------------------------------------------------------------------------\n---------------------------------------------------------------------------------------\n")
	for key, value in wDict.iteritems():
		fo.write(updateSeq(key, value, str(key) + "1"))	
	fo.write("--Reuse--------------------------------------------------------------------------------\n---------------------------------------------------------------------------------------\n")
	for key, value in rDict.iteritems():
		fo.write(updateSeq(key, value, str(key) + "1"))	
fo.close()

