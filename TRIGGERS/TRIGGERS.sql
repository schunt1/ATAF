CREATE OR REPLACE TRIGGER  "ATAF_BI_RESULT" 
  before insert on "ATAF_RESULT"               
  for each row  
begin   
  IF inserting THEN
    IF :NEW."RESULT_ID" IS NULL THEN
      SELECT to_number(sys_guid(),'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
      INTO :NEW."RESULT_ID"
      FROM sys.dual;
      SELECT ataf_pkg.compress_int(ATAF_SEQ.NEXTVAL)
      INTO :new.row_key
      FROM dual;
    END IF;
  END IF;
  :NEW.DATE_LOADED := SYSDATE;
end;
/
ALTER TRIGGER  "ATAF_BI_RESULT" ENABLE
/
CREATE OR REPLACE TRIGGER  "BI_ATAF_SEPC_RESULT" 
  before insert on "ATAF_SPEC_RESULT"               
  for each row  
begin   
  if :NEW."RESULT_SPEC_ID" is null then 
    select "ATAF_SEQ".nextval into :NEW."RESULT_SPEC_ID" from sys.dual;
    :NEW.DATE_LOADED := SYSDATE;
  end if; 
end;
/
ALTER TRIGGER  "BI_ATAF_SEPC_RESULT" ENABLE
/
CREATE OR REPLACE TRIGGER  "BI_ATAF_CASE_RESULT" 
  before insert on "ATAF_CASE_RESULT"               
  for each row  
begin   
  if :NEW."CASE_RESULT_ID" is null then 
    select "ATAF_SEQ".nextval into :NEW."CASE_RESULT_ID" from sys.dual; 
  end if; 
end; 
/
ALTER TRIGGER  "BI_ATAF_CASE_RESULT" ENABLE
/
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
CREATE OR REPLACE TRIGGER  "ATAF_BI_TEST_SPEC" 
  before insert on "ATAF_TEST_SPEC"               
  for each row  
begin   
  if :NEW."TEST_SPEC_ID" is null then
    select "ATAF_SEQ".nextval into :NEW."TEST_SPEC_ID" from sys.dual;
  end if;
  if :NEW."PROJECT_ID" is null then
    :NEW."PROJECT_ID" := nv('PROJECT_ID');
  end if; 
  :NEW.LAST_UPDATED_BY := NVL(v('APP_USER'),USER);
  :NEW.LAST_UPDATED_DATE := SYSDATE;
end;
/
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
CREATE OR REPLACE FORCE VIEW "ATAF_APEX_APPLICATION_PAGES_V" ("WORKSPACE", "WORKSPACE_DISPLAY_NAME", "APPLICATION_ID", "APPLICATION_NAME", "PAGE_ID", "PAGE_NAME", "PAGE_TITLE", "USER_INTERFACE_ID", "MEDIA_TYPE", "TAB_SET", "PAGE_ALIAS", "PAGE_FUNCTION", "ALLOW_DUPLICATE_SUBMISSIONS", "FOCUS_CURSOR", "HEADER_TEXT", "BODY_HEADER", "FOOTER_TEXT", "HELP_TEXT", "PAGE_TEMPLATE", "AUTHORIZATION_SCHEME", "AUTHORIZATION_SCHEME_ID", "BUILD_OPTION", "PAGE_HTML_HEADER", "PAGE_HTML_ONLOAD", "JAVASCRIPT_FILE_URLS", "JAVASCRIPT_CODE", "JAVASCRIPT_CODE_ONLOAD", "CSS_FILE_URLS", "INLINE_CSS", "PAGE_REQUIRES_AUTHENTICATION", "PAGE_ACCESS_PROTECTION", "REGIONS", "ITEMS", "BUTTONS", "COMPUTATIONS", "VALIDATIONS", "PROCESSES", "BRANCHES", "REPORT_COLUMNS", "PAGE_GROUP", "PAGE_GROUP_ID", "ON_DUP_SUBMISSION_GOTO_URL", "ERROR_HANDLING_FUNCTION", "ERROR_NOTIFICATION_TEXT", "FORM_AUTOCOMPLETE", "PAGE_TRANSITION", "POPUP_TRANSITION", "READ_ONLY_CONDITION_TYPE", "READ_ONLY_CONDITION_TYPE_CODE", "READ_ONLY_CONDITION_EXP1", "READ_ONLY_CONDITION_EXP2", "CACHED", "CACHE_TIMEOUT_SECONDS", "CACHED_BY_USER", "CACHE_CONDITION_TYPE", "CACHE_CONDITION_EXP_2", "PAGE_COMMENT", "CACHED_REGIONS", "CREATED_BY", "CREATED_ON", "LAST_UPDATED_BY", "LAST_UPDATED_ON", "COMPONENT_SIGNATURE", "BROWSER_CACHE", "DEEP_LINKING") AS 
  SELECT "WORKSPACE",
    "WORKSPACE_DISPLAY_NAME",
    "APPLICATION_ID",
    "APPLICATION_NAME",
    "PAGE_ID",
    "PAGE_NAME",
    "PAGE_TITLE",
    "USER_INTERFACE_ID",
    "MEDIA_TYPE",
    "TAB_SET",
    "PAGE_ALIAS",
    "PAGE_FUNCTION",
    "ALLOW_DUPLICATE_SUBMISSIONS",
    "FOCUS_CURSOR",
    "HEADER_TEXT",
    "BODY_HEADER",
    "FOOTER_TEXT",
    "HELP_TEXT",
    "PAGE_TEMPLATE",
    "AUTHORIZATION_SCHEME",
    "AUTHORIZATION_SCHEME_ID",
    "BUILD_OPTION",
    "PAGE_HTML_HEADER",
    "PAGE_HTML_ONLOAD",
    "JAVASCRIPT_FILE_URLS",
    "JAVASCRIPT_CODE",
    "JAVASCRIPT_CODE_ONLOAD",
    "CSS_FILE_URLS",
    "INLINE_CSS",
    "PAGE_REQUIRES_AUTHENTICATION",
    "PAGE_ACCESS_PROTECTION",
    "REGIONS",
    "ITEMS",
    "BUTTONS",
    "COMPUTATIONS",
    "VALIDATIONS",
    "PROCESSES",
    "BRANCHES",
    "REPORT_COLUMNS",
    "PAGE_GROUP",
    "PAGE_GROUP_ID",
    "ON_DUP_SUBMISSION_GOTO_URL",
    "ERROR_HANDLING_FUNCTION",
    "ERROR_NOTIFICATION_TEXT",
    "FORM_AUTOCOMPLETE",
    "PAGE_TRANSITION",
    "POPUP_TRANSITION",
    "READ_ONLY_CONDITION_TYPE",
    "READ_ONLY_CONDITION_TYPE_CODE",
    "READ_ONLY_CONDITION_EXP1",
    "READ_ONLY_CONDITION_EXP2",
    "CACHED",
    "CACHE_TIMEOUT_SECONDS",
    "CACHED_BY_USER",
    "CACHE_CONDITION_TYPE",
    "CACHE_CONDITION_EXP_2",
    "PAGE_COMMENT",
    "CACHED_REGIONS",
    "CREATED_BY",
    "CREATED_ON",
    "LAST_UPDATED_BY",
    "LAST_UPDATED_ON",
    "COMPONENT_SIGNATURE",
    "BROWSER_CACHE",
    "DEEP_LINKING"
  FROM apex_application_pages
  WHERE application_id = (SELECT nv('APPLICATION_ID') FROM dual)
  AND workspace = (select v('ATAF_WORKSPACE') x from dual)
/