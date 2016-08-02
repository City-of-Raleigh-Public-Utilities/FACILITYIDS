# FACILITYIDS
Ocassional Job to fix FacilityID in database

##Workflow
1.Run AutoID to fill null values
2.Run updateSequence to calculate sequences.sql
3.Update delta tables in triggers.sql
4.Run sequences.sql and triggers.sql in SQL Developer

### Credit
Thanks to Sean McKnight at the City of Durham Public Works Department for the AutoID.py source code 
