--Sewer--------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssCleanout_facilityid
  BEFORE INSERT ON RPUD.A6889
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCO', ssCleanout_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssSysValve_facilityid
  BEFORE INSERT ON RPUD.A6789
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SSV', ssSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssContValve_facilityid
  BEFORE INSERT ON RPUD.A6799
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCV', ssControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssFitting_facilityid
  BEFORE INSERT ON RPUD.A6783
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SF', ssFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssForceMain_facilityid
  BEFORE INSERT ON RPUD.A6784
  FOR EACH ROW
  BEGIN
      IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SFMN', ssForceMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssGravityMain_facilityid
  BEFORE INSERT ON RPUD.A6785
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SGMN', ssGravityMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------
--Change A Tables

CREATE OR REPLACE TRIGGER RPUD.ssLateralLine_facilityid
  BEFORE INSERT ON RPUD.A6787
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SLAT', ssLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssAerial_facilityid
  BEFORE INSERT ON RPUD.A6793
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SAM', ssAerial_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssGreaseTrap_facilityid
  BEFORE INSERT ON RPUD.A6786
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SGT', ssGreaseTrap_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssNetStruct_facilityid
  BEFORE INSERT ON RPUD.A6791
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SNS', ssNetworkStructure_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssCasing_facilityid
  BEFORE INSERT ON RPUD.A6792
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCA', ssCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssManhole_facilityid
  BEFORE INSERT ON RPUD.A6788
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

CREATE OR REPLACE TRIGGER RPUD.wControlValve_facilityid
  BEFORE INSERT ON RPUD.A13745
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WCV', wControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wFitting_facilityid
  BEFORE INSERT ON RPUD.A13748
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WFIT', wFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wGravityMain_facilityid
  BEFORE INSERT ON RPUD.A13749
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WGM', wGravityMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/

--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wLateralLine_facilityid
  BEFORE INSERT ON RPUD.A13750
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WLAT', wLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wServiceConnection_facilityid
  BEFORE INSERT ON RPUD.A13760
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSC', wServiceConnection_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wSystemValve_facilityid
  BEFORE INSERT ON RPUD.A13757
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSV', wSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wPressureMain_facilityid
  BEFORE INSERT ON RPUD.A13752
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WMN', wPressureMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wHydrant_facilityid
  BEFORE INSERT ON RPUD.A13746
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WHYD', wHydrant_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wSampleStation_facilityid
  BEFORE INSERT ON RPUD.A13756
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSS', wSampleStation_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wCasing_facilityid
  BEFORE INSERT ON RPUD.A13747
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WCAS', wCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wNetworkStructure_facilityid
  BEFORE INSERT ON RPUD.A13759
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WNS', wNetworkStructure_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
