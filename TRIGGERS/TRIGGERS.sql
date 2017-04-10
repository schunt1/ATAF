CREATE OR REPLACE TRIGGER  "BI_ATAF_DATA_GROUPS" 
  before insert on "ATAF_DATA_GROUPS"               
  for each row  
begin   
  if :NEW."DATA_GROUP_ID" is null then 
    select "ATAF_SEQ".nextval into :NEW."DATA_GROUP_ID" from sys.dual; 
  end if; 
end; 
/
ALTER TRIGGER  "BI_ATAF_DATA_GROUPS" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_USER_RESTRICTIONS" 
  before insert on "ATAF_USER_RESTRICTIONS"               
  for each row  
begin   
  if :NEW."USER_RESTRICTIONS_ID" is null then 
    select "ATAF_SEQ".nextval into :NEW."USER_RESTRICTIONS_ID" from sys.dual; 
  end if; 
  :NEW.PROJECT_ID := nv('P25_PROJECT_ID');
end; 
/
ALTER TRIGGER  "ATAF_BI_USER_RESTRICTIONS" ENABLE
/
CREATE OR REPLACE TRIGGER "ATAF_BI_TEST_SPEC" before
  INSERT OR
  UPDATE
    ON "ATAF_TEST_SPEC" FOR EACH row BEGIN IF inserting THEN IF :NEW."TEST_SPEC_ID" IS NULL THEN
  SELECT "ATAF_SEQ".nextval INTO :NEW."TEST_SPEC_ID" FROM sys.dual;
END IF;
IF :NEW."PROJECT_ID" IS NULL THEN
  :NEW."PROJECT_ID"  := nv('PROJECT_ID');
END IF;
:NEW.LAST_UPDATED_BY   := NVL(v('APP_USER'),USER);
:NEW.LAST_UPDATED_DATE := SYSDATE;
END IF;
END;
ALTER TRIGGER  "ATAF_BI_TEST_SPEC" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_TEST_DATA" 
  before insert on "ATAF_TEST_DATA"               
  for each row  
begin   
IF inserting THEN
  IF :NEW."TEST_DATA_ID" IS NULL THEN
    SELECT to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    INTO :NEW."TEST_DATA_ID"
    FROM sys.dual;
    SELECT ataf_pkg.compress_int(ATAF_SEQ.NEXTVAL)
    INTO :new.row_key
    FROM dual;
  END IF;
END IF;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_TEST_DATA" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_TEST_COND" 
  before insert on "ATAF_TEST_COND"               
  for each row  
BEGIN
IF inserting THEN
  SELECT ATAF_SEQ.nextval
  INTO :NEW."TEST_COND_ID"
  FROM sys.dual;
  SELECT ataf_pkg.compress_int(ATAF_SEQ.NEXTVAL)
  INTO :new.row_key
  FROM dual;
END IF;
:NEW.LAST_UPDATED_BY    := NVL(v('APP_USER'),USER);
:NEW.LAST_UPDATED_DATE  := SYSDATE;
:NEW.row_version_number := NVL(:old.row_version_number,1) + 1;
END;
/
ALTER TRIGGER  "ATAF_BI_TEST_COND" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_TEST_CASE" 
  before insert on "ATAF_TEST_CASE"               
  for each row  
begin   
  if :NEW."TEST_CASE_ID" is null then
    select "ATAF_SEQ".nextval into :NEW."TEST_CASE_ID" from sys.dual;
  end if;
  if :NEW."PROJECT_ID" is null then
    :NEW."PROJECT_ID" := nv('PROJECT_ID');
  end if;
  if :NEW."PRIORITY" is null then
    :NEW."PRIORITY" := 3;
  end if;
  if :NEW."STATUS" is null then
    :NEW."STATUS" := 'Draft';
  end if;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_TEST_CASE" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_SPEC_CASE" 
  before insert on "ATAF_SPEC_CASE"               
  for each row  
begin   
  if :NEW."SPEC_CASE_ID" is null then
    select "ATAF_SEQ".nextval into :NEW."SPEC_CASE_ID" from sys.dual;
  end if;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_SPEC_CASE" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_SELENIUM" before
  INSERT ON "ATAF_SELENIUM" FOR EACH row 
BEGIN 
IF inserting THEN
  IF :NEW."SELENIUM_ID" IS NULL THEN   
    SELECT to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    INTO :NEW."SELENIUM_ID"
    FROM sys.dual;
    SELECT ataf_pkg.compress_int(ATAF_SEQ.NEXTVAL)
    INTO :new.row_key
    FROM dual;
    IF :NEW.theme_number is null THEN
      :NEW.theme_number   := nv('P3_THEME_NUMBER');
    END IF;
  END IF;
END IF;
:NEW.LAST_UPDATED_BY    := NVL(v('APP_USER'),USER);
:NEW.LAST_UPDATED_DATE  := SYSDATE;
:NEW.row_version_number := NVL(:old.row_version_number,1) + 1;
END;
/
ALTER TRIGGER  "ATAF_BI_SELENIUM" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_PROJECT" 
  before insert on "ATAF_PROJECT"               
  for each row  
begin   
  if :NEW."PROJECT_ID" is null then
    select "ATAF_SEQ".nextval into :NEW."PROJECT_ID" from sys.dual;
  end if;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_PROJECT" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_MODULE" 
  before insert on "ATAF_MODULE"               
  for each row  
begin   
  if :NEW."MODULE_ID" is null then
    select "ATAF_SEQ".nextval into :NEW."MODULE_ID" from sys.dual;
  end if;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_MODULE" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_ITEM" 
  before insert on "ATAF_ITEM"               
  for each row  
begin  
  if inserting then
    if :NEW.application_id is null then
    :NEW.application_id := v('APPLICATION_ID');
    end if;
    if :NEW."ITEM_ID" is null then
      select "ATAF_SEQ".nextval into :NEW."ITEM_ID" from sys.dual;
    end if;
  end if; 
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_ITEM" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_DATA_ITEM" 
  before insert on "ATAF_DATA_ITEM"               
  for each row  
begin
  DECLARE lv_attr NUMBER;
  BEGIN
    IF inserting THEN
      IF :new.data_attribute IS NULL THEN
        SELECT MAX(data_attribute) INTO lv_attr FROM ataf_data_item
        WHERE test_data_id = :new.test_data_id;
        SELECT nvl(lv_attr, -1) + 1 INTO :new.data_attribute FROM dual;
      END IF;
      IF :NEW."DATA_ITEM_ID" IS NULL THEN
        SELECT to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        INTO :NEW."DATA_ITEM_ID"
        FROM sys.dual;
        SELECT ataf_pkg.compress_int(ATAF_SEQ.NEXTVAL)
        INTO :new.row_key
        FROM dual;
        END IF;
    END IF;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
  END;
end;
/
ALTER TRIGGER  "ATAF_BI_DATA_ITEM" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_DATA" 
  before insert on "ATAF_DATA"               
  for each row  
begin   
 IF inserting THEN
  IF :NEW."DATA_ID" IS NULL THEN
    SELECT to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    INTO :NEW."DATA_ID"
    FROM sys.dual;
    SELECT ataf_pkg.compress_int(ATAF_SEQ.NEXTVAL)
    INTO :new.row_key
    FROM dual;
  END IF;
 END IF;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
  IF :NEW.TEST_DATA_ID IS NULL THEN
    :NEW.TEST_DATA_ID := nv('TEST_DATA_ID');
  END IF;
end;
/
ALTER TRIGGER  "ATAF_BI_DATA" ENABLE
/
CREATE OR REPLACE TRIGGER  "ATAF_BI_ACTION" 
  before insert on "ATAF_ACTION"               
  for each row  
begin   
  IF inserting THEN
    IF :NEW."ACTION_ID" IS NULL THEN
      SELECT to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
      INTO :NEW."ACTION_ID"
      FROM sys.dual;
      SELECT ataf_pkg.compress_int(ATAF_SEQ.NEXTVAL)
      INTO :new.row_key
      FROM dual;
    END IF;
  END IF;
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_ACTION" ENABLE
/
CREATE OR REPLACE TRIGGER "ATAF_TEST_CASE_AIUD" AFTER
  INSERT OR
  UPDATE OR
  DELETE
    ON "ATAF_TEST_CASE" FOR EACH row DECLARE lv_test_spec_id NUMBER;
BEGIN

FOR i IN (
  SELECT test_spec_id
  INTO lv_test_spec_id
  FROM ataf_spec_case
  WHERE test_case_id = :NEW."TEST_CASE_ID")
  
LOOP

  UPDATE ataf_test_spec
  SET change_flag = 'Y'
  WHERE test_spec_id = i.test_spec_id;
  
END LOOP;

END;
/
ALTER TRIGGER  "ATAF_TEST_CASE_AIUD" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "ATAF_TEST_COND_AIUD" 
AFTER
insert or update or delete on "ATAF_TEST_COND"
for each row

DECLARE

  lv_test_spec_id NUMBER;

BEGIN

FOR i IN (
  SELECT test_spec_id
  INTO lv_test_spec_id
  FROM ataf_spec_case
  WHERE test_case_id = :NEW."TEST_CASE_ID")
  
LOOP

  UPDATE ataf_test_spec
  SET change_flag = 'Y'
  WHERE test_spec_id = i.test_spec_id;
  
END LOOP;

END;
/
ALTER TRIGGER  "ATAF_TEST_COND_AIUD" ENABLE
/
CREATE OR REPLACE TRIGGER  "BI_ATAF_TL_JOB" 
  before insert on "ATAF_TL_JOB"               
  for each row  
begin   
  if :NEW."TL_JOB_ID" is null then 
    select "ATAF_SEQ".nextval into :NEW."TL_JOB_ID" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_ATAF_TL_JOB" ENABLE
/
CREATE OR REPLACE TRIGGER  "BI_ATAF_TL_TEST" 
  before insert on "ATAF_TL_TEST"               
  for each row  
begin   
  if :NEW."TL_TEST_ID" is null then 
    select "ATAF_SEQ".nextval into :NEW."TL_TEST_ID" from sys.dual; 
  end if; 
end; 

/
ALTER TRIGGER  "BI_ATAF_TL_TEST" ENABLE
/