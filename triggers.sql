--Sewer--------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssCleanout_facilityid
  BEFORE INSERT ON RPUD.A438223
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCO', ssCleanout_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssSysValve_facilityid
  BEFORE INSERT ON RPUD.A438212
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SSV', ssSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssContValve_facilityid
  BEFORE INSERT ON RPUD.A438213
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCV', ssControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssFitting_facilityid
  BEFORE INSERT ON RPUD.A438211
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SF', ssFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssForceMain_facilityid
  BEFORE INSERT ON RPUD.A438216
  FOR EACH ROW
  BEGIN
      IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SFMN', ssForceMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssGravityMain_facilityid
  BEFORE INSERT ON RPUD.A438224
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SGMN', ssGravityMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssLateralLine_facilityid
  BEFORE INSERT ON RPUD.A438217
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SLAT', ssLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssAerial_facilityid
  BEFORE INSERT ON RPUD.A438218
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SAM', ssAerial_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssGreaseTrap_facilityid
  BEFORE INSERT ON RPUD.A438219
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SGT', ssGreaseTrap_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssNetStruct_facilityid
  BEFORE INSERT ON RPUD.A438225
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SNS', ssNetworkStructure_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssCasing_facilityid
  BEFORE INSERT ON RPUD.A438210
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCA', ssCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssManhole_facilityid
  BEFORE INSERT ON RPUD.A438220
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SMH', ssManhole_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

--Water--------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wControlValve_facilityid
  BEFORE INSERT ON RPUD.A438480
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WCV', wControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wFitting_facilityid
  BEFORE INSERT ON RPUD.A438477
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WFIT', wFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wGravityMain_facilityid
  BEFORE INSERT ON RPUD.A438488
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WGM', wGravityMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wLateralLine_facilityid
  BEFORE INSERT ON RPUD.A438475
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WLAT', wLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wServiceConnection_facilityid
  BEFORE INSERT ON RPUD.A438481
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSC', wServiceConnection_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wSystemValve_facilityid
  BEFORE INSERT ON RPUD.A438483
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSV', wSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wPressureMain_facilityid
  BEFORE INSERT ON RPUD.A438485
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WMN', wPressureMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wHydrant_facilityid
  BEFORE INSERT ON RPUD.A438487
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WHYD', wHydrant_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wSampleStation_facilityid
  BEFORE INSERT ON RPUD.A438478
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSS', wSampleStation_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wCasing_facilityid
  BEFORE INSERT ON RPUD.A438484
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WCAS', wCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wNetworkStructure_facilityid
  BEFORE INSERT ON RPUD.A438479
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WNS', wNetworkStructure_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

--Reclaimed Water----------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rCasing_facilityid
  BEFORE INSERT ON RPUD.A438323
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rControlValve_facilityid
  BEFORE INSERT ON RPUD.A438313
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCV', rControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rFitting_facilityid
  BEFORE INSERT ON RPUD.A438321
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RFIT', rFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rHyrant_facilityid
  BEFORE INSERT ON RPUD.A438314
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RHYD', rHydrant_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rLateralLine_facilityid
  BEFORE INSERT ON RPUD.A438322
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RLAT', rLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rNetworkStructure_facilityid
  BEFORE INSERT ON RPUD.A438312
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RNS', rNetworkStructure_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rPressureMain_facilityid
  BEFORE INSERT ON RPUD.A438318
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RMN', rPressureMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rSampleStation_facilityid
  BEFORE INSERT ON RPUD.A438319
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RSS', rSampleStation_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rServiceConnection_facilityid
  BEFORE INSERT ON RPUD.A438317
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RSC', rServiceConnection_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rSystemValve_facilityid
  BEFORE INSERT ON RPUD.A438320
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RSV', rSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
  /
---------------------------------------------------------------------------------------



---Project Tracking--------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
create or replace TRIGGER RPUD.project_tracking_PROJECTID
 BEFORE INSERT ON RPUD.A438381
 FOR EACH ROW
 BEGIN
   IF :new.PROJECTID IS NULL THEN
     SELECT project_tracking_seq.nextval INTO :new.PROJECTID FROM DUAL;
   END IF;
 END;



