--Sewer--------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssCleanout_facilityid
  BEFORE INSERT ON RPUD.A71026
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCO', ssCleanout_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssSysValve_facilityid
  BEFORE INSERT ON RPUD.A71018
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SSV', ssSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssContValve_facilityid
  BEFORE INSERT ON RPUD.A71025
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCV', ssControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssFitting_facilityid
  BEFORE INSERT ON RPUD.A71028
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SF', ssFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssForceMain_facilityid
  BEFORE INSERT ON RPUD.A71029
  FOR EACH ROW
  BEGIN
      IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SFMN', ssForceMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssGravityMain_facilityid
  BEFORE INSERT ON RPUD.A71030
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
  BEFORE INSERT ON RPUD.A71034
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SLAT', ssLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssAerial_facilityid
  BEFORE INSERT ON RPUD.A71021
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SAM', ssAerial_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssGreaseTrap_facilityid
  BEFORE INSERT ON RPUD.A71033
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SGT', ssGreaseTrap_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssNetStruct_facilityid
  BEFORE INSERT ON RPUD.A71020
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SNS', ssNetworkStructure_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssCasing_facilityid
  BEFORE INSERT ON RPUD.A71022
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('SCA', ssCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
---------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.ssManhole_facilityid
  BEFORE INSERT ON RPUD.A71017
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
  BEFORE INSERT ON RPUD.A70988
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WCV', wControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wFitting_facilityid
  BEFORE INSERT ON RPUD.A70992
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WFIT', wFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wGravityMain_facilityid
  BEFORE INSERT ON RPUD.A70995
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WGM', wGravityMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/

--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wLateralLine_facilityid
  BEFORE INSERT ON RPUD.A70996
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WLAT', wLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wServiceConnection_facilityid
  BEFORE INSERT ON RPUD.A71003
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSC', wServiceConnection_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wSystemValve_facilityid
  BEFORE INSERT ON RPUD.A71000
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSV', wSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wPressureMain_facilityid
  BEFORE INSERT ON RPUD.A70998
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WMN', wPressureMain_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wHydrant_facilityid
  BEFORE INSERT ON RPUD.A70990
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WHYD', wHydrant_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wSampleStation_facilityid
  BEFORE INSERT ON RPUD.A70999
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WSS', wSampleStation_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wCasing_facilityid
  BEFORE INSERT ON RPUD.A70991
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('WCAS', wCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL;
    END IF;
  END;
/
--------------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER RPUD.wNetworkStructure_facilityid
  BEFORE INSERT ON RPUD.A71002
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
CREATE OR REPLACE TRIGGER RPUD.rCasing_facilityid
  BEFORE INSERT ON RPUD.A71057
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rCasing_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rControlValve_facilityid
  BEFORE INSERT ON RPUD.A71052
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rControlValve_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rFitting_facilityid
  BEFORE INSERT ON RPUD.A71049
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rFitting_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rHyrant_facilityid
  BEFORE INSERT ON RPUD.A71047
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rHydrant_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rLateralLine_facilityid
  BEFORE INSERT ON RPUD.A71058
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rLateralLine_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rNetworkStructure_facilityid
  BEFORE INSERT ON RPUD.A71053
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rNetworkStructure_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rPressureMain_facilityid
  BEFORE INSERT ON RPUD.A71048
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rPressureMain_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rSamplingStation_facilityid
  BEFORE INSERT ON RPUD.A71050
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rSamplingStation_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rServiceConnection_facilityid
  BEFORE INSERT ON RPUD.A71056
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rServiceConnection_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER RPUD.rSystemValve_facilityid
  BEFORE INSERT ON RPUD.A71051
  FOR EACH ROW
  BEGIN
    IF (:new.CREATEDON = :new.EDITEDON) THEN
      SELECT CONCAT('RCAS', rSystemValve_seq.nextval) INTO :new.FACILITYID FROM DUAL
    END IF;
  END;
  /
---------------------------------------------------------------------------------------