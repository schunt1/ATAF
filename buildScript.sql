CREATE TABLE  "ATAF_PROJECT" 
   (	"PROJECT_ID" NUMBER, 
	"PROJECT_NAME" VARCHAR2(128) NOT NULL ENABLE, 
	"APPLICATION_ID" NUMBER NOT NULL ENABLE, 
	"DOMAIN" VARCHAR2(256), 
	"LOGIN_PAGE" VARCHAR2(64), 
	"VERSION" VARCHAR2(16), 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"ACCESS_RESTRICTIONS" VARCHAR2(16), 
	"OWNER" VARCHAR2(32), 
	 CONSTRAINT "PROJECT_PK" PRIMARY KEY ("PROJECT_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_ACTION" 
   (	"ACTION_ID" NUMBER, 
	"ITEM_TYPE" VARCHAR2(32) NOT NULL ENABLE, 
	"ACTION" VARCHAR2(64) NOT NULL ENABLE, 
	"PROJECT_ID" NUMBER, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"ROW_KEY" VARCHAR2(16) NOT NULL ENABLE, 
	"SCRIPT" VARCHAR2(256) NOT NULL ENABLE, 
	"DATA_YN" VARCHAR2(1), 
	"NOTES" VARCHAR2(4000), 
	"AND_WAIT" VARCHAR2(1), 
	 CONSTRAINT "ACTION_PK" PRIMARY KEY ("ACTION_ID") ENABLE, 
	 CONSTRAINT "ACTION_UK1" UNIQUE ("ITEM_TYPE", "ACTION") ENABLE
   )
/
CREATE TABLE  "ATAF_TEST_DATA" 
   (	"TEST_DATA_ID" NUMBER, 
	"DATA_NAME" VARCHAR2(64), 
	"PROJECT_ID" NUMBER, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"ROW_KEY" VARCHAR2(16) NOT NULL ENABLE, 
	"DEFAULT_DATA_GROUP_ID" NUMBER, 
	 CONSTRAINT "TEST_DATA_PK" PRIMARY KEY ("TEST_DATA_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_DATA_GROUPS" 
   (	"DATA_GROUP_ID" NUMBER, 
	"DATA_GROUP" VARCHAR2(64), 
	"TEST_DATA_ID" NUMBER, 
	 CONSTRAINT "ATAF_DATA_GROUPS_PK" PRIMARY KEY ("DATA_GROUP_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_DATA" 
   (	"DATA_ID" NUMBER, 
	"ATTRIBUTE_1" VARCHAR2(4000), 
	"ATTRIBUTE_2" VARCHAR2(4000), 
	"ATTRIBUTE_3" VARCHAR2(4000), 
	"ATTRIBUTE_4" VARCHAR2(4000), 
	"ATTRIBUTE_5" VARCHAR2(4000), 
	"ATTRIBUTE_6" VARCHAR2(4000), 
	"ATTRIBUTE_7" VARCHAR2(4000), 
	"ATTRIBUTE_8" VARCHAR2(4000), 
	"ATTRIBUTE_9" VARCHAR2(4000), 
	"ATTRIBUTE_10" VARCHAR2(4000), 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"ROW_KEY" VARCHAR2(16) NOT NULL ENABLE, 
	"TEST_DATA_ID" NUMBER NOT NULL ENABLE, 
	"ROW_NAME" VARCHAR2(256) NOT NULL ENABLE, 
	"DATA_GROUP_ID" NUMBER, 
	"ATTRIBUTE_11" VARCHAR2(4000), 
	"ATTRIBUTE_12" VARCHAR2(4000), 
	"ATTRIBUTE_13" VARCHAR2(4000), 
	"ATTRIBUTE_14" VARCHAR2(4000), 
	"ATTRIBUTE_15" VARCHAR2(4000), 
	"ATTRIBUTE_16" VARCHAR2(4000), 
	"ATTRIBUTE_17" VARCHAR2(4000), 
	"ATTRIBUTE_18" VARCHAR2(4000), 
	"ATTRIBUTE_19" VARCHAR2(4000), 
	"ATTRIBUTE_20" VARCHAR2(4000), 
	 CONSTRAINT "DATA_PK" PRIMARY KEY ("DATA_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_DATA_ITEM" 
   (	"DATA_ITEM_ID" NUMBER, 
	"DATA_ITEM_NAME" VARCHAR2(64) NOT NULL ENABLE, 
	"DATA_ITEM_VALUE" VARCHAR2(4000), 
	"DATA_ATTRIBUTE" NUMBER NOT NULL ENABLE, 
	"TEST_DATA_ID" NUMBER NOT NULL ENABLE, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"ROW_KEY" VARCHAR2(16) NOT NULL ENABLE, 
	"DATA_FUNCTION" NUMBER, 
	"RANDOM_DATA" VARCHAR2(1), 
	"PARAMETER1" VARCHAR2(30), 
	"PARAMETER2" VARCHAR2(30), 
	 CONSTRAINT "DATA_ITEM_PK" PRIMARY KEY ("DATA_ITEM_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_ITEM" 
   (	"ITEM_ID" NUMBER, 
	"ITEM_NAME" VARCHAR2(64) NOT NULL ENABLE, 
	"ITEM_DOM_ID" VARCHAR2(64), 
	"PAGE_ID" NUMBER NOT NULL ENABLE, 
	"DISPLAY_SEQUENCE" NUMBER, 
	"ITEM_LABEL" VARCHAR2(128), 
	"APPLICATION_ID" NUMBER NOT NULL ENABLE, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"ITEM_TYPE" VARCHAR2(16) NOT NULL ENABLE, 
	 CONSTRAINT "ITEM_PK" PRIMARY KEY ("ITEM_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_MODULE" 
   (	"MODULE_ID" NUMBER, 
	"MODULE" VARCHAR2(128) NOT NULL ENABLE, 
	"PROJECT_ID" NUMBER NOT NULL ENABLE, 
	"MODULE_REF_ID" NUMBER, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	 CONSTRAINT "MODULE_PK" PRIMARY KEY ("MODULE_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_SELENIUM" 
   (	"SELENIUM_ID" NUMBER, 
	"SELENIUM_COMMAND" VARCHAR2(64), 
	"ACTION_ID" NUMBER, 
	"DATA_YN" VARCHAR2(1), 
	"LOCATION" VARCHAR2(64), 
	"TARGET" VARCHAR2(128), 
	"ITEM_ATTRIBUTE" VARCHAR2(16), 
	"ROW_KEY" VARCHAR2(16) NOT NULL ENABLE, 
	"SORT_ORDER" NUMBER, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"ROW_VERSION_NUMBER" NUMBER NOT NULL ENABLE, 
	"THEME_NUMBER" NUMBER, 
	 CONSTRAINT "SELENIUM_PK" PRIMARY KEY ("SELENIUM_ID", "THEME_NUMBER") ENABLE, 
	 CONSTRAINT "SELENIUM_UNI" UNIQUE ("ROW_KEY") ENABLE
   )
/
CREATE TABLE  "ATAF_TEST_CASE" 
   (	"TEST_CASE_ID" NUMBER, 
	"TEST_CASE" VARCHAR2(128) NOT NULL ENABLE, 
	"MODULE_ID" NUMBER NOT NULL ENABLE, 
	"PRIORITY" NUMBER NOT NULL ENABLE, 
	"STATUS" VARCHAR2(8) NOT NULL ENABLE, 
	"NOTES" VARCHAR2(4000), 
	"PROJECT_ID" NUMBER NOT NULL ENABLE, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"TEST_DATA_ID" NUMBER, 
	 CONSTRAINT "TEST_CASE_PK" PRIMARY KEY ("TEST_CASE_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_TEST_SPEC" 
   (	"TEST_SPEC_ID" NUMBER, 
	"TEST_SPEC" VARCHAR2(128) NOT NULL ENABLE, 
	"TEST_TYPE" VARCHAR2(32) NOT NULL ENABLE, 
	"PROJECT_ID" NUMBER NOT NULL ENABLE, 
	"AUTOMATE" VARCHAR2(1), 
	"SORT_ORDER" NUMBER, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"NOTES" VARCHAR2(4000), 
	"MODULE_ID" NUMBER, 
	 CONSTRAINT "TEST_SPEC_PK" PRIMARY KEY ("TEST_SPEC_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_SPEC_CASE" 
   (	"SPEC_CASE_ID" NUMBER, 
	"TEST_SPEC_ID" NUMBER NOT NULL ENABLE, 
	"TEST_CASE_ID" NUMBER NOT NULL ENABLE, 
	"SORT_ORDER" NUMBER NOT NULL ENABLE, 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"DATA_ID" NUMBER, 
	"DATA_GROUP_ID" NUMBER, 
	 CONSTRAINT "SPEC_CASE_PK" PRIMARY KEY ("SPEC_CASE_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_SYSTEM_PARAMETERS" 
   (	"NAME" VARCHAR2(1000) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(1000), 
	"VALUE" VARCHAR2(1000), 
	"VALUE_LARGE" CLOB, 
	"VALUE_RAW" RAW(64), 
	"START_DATE" DATE NOT NULL ENABLE, 
	"END_DATE" DATE
   )
/
CREATE TABLE  "ATAF_TEST_CASE_IOT" 
   (	"TEST_CASE_ID" NUMBER, 
	"TEST_CASE_REF_ID" NUMBER, 
	 CONSTRAINT "TEST_CASE_IOT_PK" PRIMARY KEY ("TEST_CASE_ID", "TEST_CASE_REF_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_TEST_COND" 
   (	"TEST_COND_ID" NUMBER, 
	"TEST_CASE_ID" NUMBER NOT NULL ENABLE, 
	"DATA_ITEM_ID" NUMBER, 
	"ACTION_ID" NUMBER NOT NULL ENABLE, 
	"OUTCOME_ID" NUMBER, 
	"OUTCOME_PAGE_ID" VARCHAR2(32), 
	"APEX_ITEM_ID" NUMBER, 
	"SORT_ORDER" NUMBER, 
	"PAGE_ID" VARCHAR2(32) NOT NULL ENABLE, 
	"ROW_NUMBER" VARCHAR2(16), 
	"LAST_UPDATED_DATE" DATE NOT NULL ENABLE, 
	"LAST_UPDATED_BY" VARCHAR2(32) NOT NULL ENABLE, 
	"ROW_KEY" VARCHAR2(16) NOT NULL ENABLE, 
	"ROW_VERSION_NUMBER" NUMBER NOT NULL ENABLE, 
	"DATA_ATTRIBUTE" NUMBER, 
	"DATA_ID" NUMBER, 
	"DATA_GROUP_ID" NUMBER, 
	 CONSTRAINT "TEST_CONFIG_PK" PRIMARY KEY ("TEST_COND_ID") ENABLE
   )
/
CREATE TABLE  "ATAF_USER_RESTRICTIONS" 
   (	"USER_RESTRICTIONS_ID" NUMBER, 
	"USERNAME" VARCHAR2(128) NOT NULL ENABLE, 
	"ACCESS_LEVEL" VARCHAR2(16) NOT NULL ENABLE, 
	"PROJECT_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "USER_ACCESS_PK" PRIMARY KEY ("USER_RESTRICTIONS_ID") ENABLE
   )
/
ALTER TABLE  "ATAF_ACTION" ADD CONSTRAINT "ACTION_FK2" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES  "ATAF_PROJECT" ("PROJECT_ID") ENABLE
/
ALTER TABLE  "ATAF_DATA" ADD CONSTRAINT "ATAF_DATA_FK" FOREIGN KEY ("TEST_DATA_ID")
	  REFERENCES  "ATAF_TEST_DATA" ("TEST_DATA_ID") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ATAF_DATA" ADD CONSTRAINT "ATAF_DATA_FK1" FOREIGN KEY ("DATA_GROUP_ID")
	  REFERENCES  "ATAF_DATA_GROUPS" ("DATA_GROUP_ID") ENABLE
/
ALTER TABLE  "ATAF_DATA_GROUPS" ADD CONSTRAINT "ATAF_DATA_GROUPS_FK" FOREIGN KEY ("TEST_DATA_ID")
	  REFERENCES  "ATAF_TEST_DATA" ("TEST_DATA_ID") ENABLE
/
ALTER TABLE  "ATAF_SPEC_CASE" ADD CONSTRAINT "ATAF_SPEC_CASE_FK1" FOREIGN KEY ("DATA_GROUP_ID")
	  REFERENCES  "ATAF_DATA_GROUPS" ("DATA_GROUP_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_COND" ADD CONSTRAINT "ATAF_TEST_COND_FK5" FOREIGN KEY ("DATA_GROUP_ID")
	  REFERENCES  "ATAF_DATA_GROUPS" ("DATA_GROUP_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_SPEC" ADD CONSTRAINT "ATAF_TEST_SPEC_CON" FOREIGN KEY ("MODULE_ID")
	  REFERENCES  "ATAF_MODULE" ("MODULE_ID") ENABLE
/
ALTER TABLE  "ATAF_DATA_ITEM" ADD CONSTRAINT "DATA_ITEM_FK" FOREIGN KEY ("TEST_DATA_ID")
	  REFERENCES  "ATAF_TEST_DATA" ("TEST_DATA_ID") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ATAF_MODULE" ADD CONSTRAINT "MODULE_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES  "ATAF_PROJECT" ("PROJECT_ID") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ATAF_MODULE" ADD CONSTRAINT "MODULE_FK2" FOREIGN KEY ("MODULE_REF_ID")
	  REFERENCES  "ATAF_MODULE" ("MODULE_ID") ON DELETE SET NULL ENABLE
/
ALTER TABLE  "ATAF_SELENIUM" ADD CONSTRAINT "SELENIUM_FK" FOREIGN KEY ("ACTION_ID")
	  REFERENCES  "ATAF_ACTION" ("ACTION_ID") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ATAF_SPEC_CASE" ADD CONSTRAINT "SPEC_CASE_FK" FOREIGN KEY ("TEST_SPEC_ID")
	  REFERENCES  "ATAF_TEST_SPEC" ("TEST_SPEC_ID") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ATAF_SPEC_CASE" ADD CONSTRAINT "SPEC_CASE_FK2" FOREIGN KEY ("TEST_CASE_ID")
	  REFERENCES  "ATAF_TEST_CASE" ("TEST_CASE_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_CASE" ADD CONSTRAINT "TEST_CASE_CON_FK" FOREIGN KEY ("MODULE_ID")
	  REFERENCES  "ATAF_MODULE" ("MODULE_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_CASE" ADD CONSTRAINT "TEST_CASE_FK" FOREIGN KEY ("TEST_DATA_ID")
	  REFERENCES  "ATAF_TEST_DATA" ("TEST_DATA_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_CASE_IOT" ADD CONSTRAINT "TEST_CASE_IOT_FK" FOREIGN KEY ("TEST_CASE_ID")
	  REFERENCES  "ATAF_TEST_CASE" ("TEST_CASE_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_CASE_IOT" ADD CONSTRAINT "TEST_CASE_IOT_FK2" FOREIGN KEY ("TEST_CASE_REF_ID")
	  REFERENCES  "ATAF_TEST_CASE" ("TEST_CASE_ID") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ATAF_TEST_COND" ADD CONSTRAINT "TEST_CONFIG_FK1" FOREIGN KEY ("TEST_CASE_ID")
	  REFERENCES  "ATAF_TEST_CASE" ("TEST_CASE_ID") ON DELETE CASCADE ENABLE
/
ALTER TABLE  "ATAF_TEST_COND" ADD CONSTRAINT "TEST_CONFIG_FK2" FOREIGN KEY ("DATA_ITEM_ID")
	  REFERENCES  "ATAF_DATA_ITEM" ("DATA_ITEM_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_COND" ADD CONSTRAINT "TEST_CONFIG_FK3" FOREIGN KEY ("ACTION_ID")
	  REFERENCES  "ATAF_ACTION" ("ACTION_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_COND" ADD CONSTRAINT "TEST_CONFIG_FK4" FOREIGN KEY ("OUTCOME_ID")
	  REFERENCES  "ATAF_ACTION" ("ACTION_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_DATA" ADD CONSTRAINT "TEST_DATA_FK2" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES  "ATAF_PROJECT" ("PROJECT_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_DATA" ADD CONSTRAINT "TEST_DATA_FK3" FOREIGN KEY ("DEFAULT_DATA_GROUP_ID")
	  REFERENCES  "ATAF_DATA_GROUPS" ("DATA_GROUP_ID") ENABLE
/
ALTER TABLE  "ATAF_TEST_SPEC" ADD CONSTRAINT "TEST_SPEC_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES  "ATAF_PROJECT" ("PROJECT_ID") ENABLE
/
ALTER TABLE  "ATAF_USER_RESTRICTIONS" ADD CONSTRAINT "USER_ACCESS_FK" FOREIGN KEY ("PROJECT_ID")
	  REFERENCES  "ATAF_PROJECT" ("PROJECT_ID") ENABLE
/
CREATE UNIQUE INDEX  "ATAF_SYSTEM_PARAMETERS_UK1" ON  "ATAF_SYSTEM_PARAMETERS" ("NAME")
/
CREATE OR REPLACE PACKAGE  "ATAF_PKG" 
AS
--
--+============================================================================
--|                     Apex Test Automation Framework
--|                                Andover
--+=============================================================================+
--|                                                                             |
--| $Author: $                                                                  |
--| $Date: $                                                                    |
--| $Revision: $                                                                |
--| $HeadURL: $                                                                 |
--|                                                                             |
--| Description : Package for all general functions and procedures              |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
--
--+=============================================================================+
--| Description : Type for converting colon sperated lists into tables          |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
TYPE ret_val_t
IS
  TABLE OF VARCHAR(4000);
--
--+=============================================================================+
--| Description : Pipleline function for return a colon separated list into a   |
--|               table.                                                        |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION checkbox_table(
      p_checkbox VARCHAR2)
    RETURN ret_val_t PIPELINED;
--
--+=============================================================================+
--| Description : Oracle function for converting a PK ID into a unique string   |
--|               This is very useful for using as a ref                        |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION "COMPRESS_INT"(
      n IN INTEGER )
    RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : Procedure that generates the selenium scripts.                |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  PROCEDURE test(
      p_spec_id IN NUMBER,
      p_case_id IN NUMBER,
      p_domain  IN VARCHAR2
    );
--
--+=============================================================================+
--| Description : function that performs the Replace for substitution strings   |
--|               used in the creation of the Selenium scripts                  |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION test_func(
      p_id                 IN NUMBER,
      p_target             IN VARCHAR2,
      p_dom_id             IN VARCHAR2,
      p_name               IN VARCHAR2,
      p_label              IN VARCHAR2,
      p_data               IN VARCHAR2,
      p_page_title         IN VARCHAR2,
      p_element            IN VARCHAR2,
      p_application_id     IN NUMBER,
      p_page_id            IN VARCHAR2,
      p_row                IN VARCHAR2,
      p_region_id          IN VARCHAR2,
      p_region_name        IN VARCHAR2,
      p_domain             IN VARCHAR2,
      p_outcome_page_id    IN VARCHAR2,
      p_outcome_page_title IN VARCHAR2)
    RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : new version of apex_util.current_user_in_group to rtn varchar |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         17-Jul-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION current_user_in_group(
      p_group_name IN VARCHAR2)
    RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : returns test data columns                                     |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION return_cols RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : returns the start date of the financial year                  |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION return_fy_start (
      p_date IN DATE)
      RETURN DATE;
--
--+=============================================================================+
--| Description : returns a random data item for a specified attribute number   |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         18-Aug-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION random_data (
      p_attribute    IN NUMBER,
      p_test_data_id IN NUMBER)
      RETURN VARCHAR;
--
--+=============================================================================+
--| Description : Pipleline function for return a separated list into a tavle   |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION ret_table(
      p_string VARCHAR2, p_separator VARCHAR2)
    RETURN ret_val_t PIPELINED;
END;
/
create or replace PACKAGE BODY  "ATAF_PKG" 
IS
--
--+============================================================================
--|                     Apex Test Automation Framework
--|                                Andover
--+=============================================================================+
--|                                                                             |
--| $Author: $                                                                  |
--| $Date: $                                                                    |
--| $Revision: $                                                                |
--| $HeadURL: $                                                                 |
--|                                                                             |
--| Description : Package for all general functions and procedures              |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--| S. Hunt         02-Jul-16 2       Update to Test procedure                  |
--+=============================================================================+
--
--+=============================================================================+
--| Description : Pipleline function for return a colon separated list into a   |
--|               table.                                                        |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION checkbox_table(
    p_checkbox VARCHAR2)
  RETURN ret_val_t PIPELINED
IS
  l_vc_arr2 apex_application_global.vc_arr2;
BEGIN
  l_vc_arr2 := apex_util.string_to_table(p_checkbox);
  FOR z IN 1 .. l_vc_arr2.COUNT
  LOOP
    PIPE ROW(l_vc_arr2(z));
  END LOOP;
END checkbox_table;
--
--+=============================================================================+
--| Description : Oracle function for converting a PK ID into a unique string   |
--|               This is very useful for using as a ref                        |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION "COMPRESS_INT"(
    n IN INTEGER )
  RETURN VARCHAR2
IS
  ret       VARCHAR2(30);
  quotient  INTEGER;
  remainder INTEGER;
  digit     CHAR(1);
BEGIN
  ret           := '';
  quotient      := n;
  WHILE quotient > 0
  LOOP
    remainder   := mod(quotient, 10 + 26);
    quotient    := floor(quotient   / (10 + 26));
    IF remainder < 26 THEN
      digit     := chr(ascii('A') + remainder);
    ELSE
      digit := chr(ascii('0') + remainder - 26);
    END IF;
    ret := digit || ret;
  END LOOP ;
  IF LENGTH(ret) < 5 THEN
    ret         := lpad(ret, 4, 'A');
  END IF ;
  RETURN ret;
END compress_int;
--
--+=============================================================================+
--| Description : Procedure that generates the selenium scripts.                |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION TEST_FUNC(
    p_id                 IN NUMBER,
    p_target             IN VARCHAR2,
    p_dom_id             IN VARCHAR2,
    p_name               IN VARCHAR2,
    p_label              IN VARCHAR2,
    p_data               IN VARCHAR2,
    p_page_title         IN VARCHAR2,
    p_element            IN VARCHAR2,
    p_application_id     IN NUMBER,
    p_page_id            IN VARCHAR2,
    p_row                IN VARCHAR2,
    p_region_id          IN VARCHAR2,
    p_region_name        IN VARCHAR2,
    p_domain             IN VARCHAR2,
    p_outcome_page_id    IN VARCHAR2,
    p_outcome_page_title IN VARCHAR2)
  RETURN VARCHAR2
IS
  l_str VARCHAR2(4000) := p_target;
BEGIN
  l_str := REPLACE(l_str,'#ID#',p_id);
  l_str := REPLACE(l_str,'#DOM_ID#',p_dom_id);
  l_str := REPLACE(l_str,'#NAME#',p_name);
  l_str := REPLACE(l_str,'#LABEL#',p_label);
  l_str := REPLACE(l_str,'#DATA#',p_data);
  l_str := REPLACE(l_str,'#PAGE TITLE#',p_page_title);
  l_str := REPLACE(l_str,'#PAGE ID#',p_page_id);
  l_str := REPLACE(l_str,'#ROW#',p_row);
  l_str := REPLACE(l_str,'#REGION ID#',p_region_id);
  l_str := REPLACE(l_str,'#APP ID#',p_application_id);
  l_str := REPLACE(l_str,'#REGION NAME#',p_region_name);
  l_str := REPLACE(l_str,'#DOMAIN#',p_domain);
  l_str := REPLACE(l_str,'#OUTCOME PAGE ID#',p_outcome_page_id);
  l_str := REPLACE(l_str,'#OUTCOME PAGE TITLE#',p_outcome_page_title);
  --Replace substitution strings
  BEGIN
    FOR i IN
    (SELECT shortcut, shortcut_name FROM apex_application_shortcuts
    )
    LOOP
      l_str := REPLACE(l_str,'#'||i.shortcut_name||'#',i.shortcut);
    END LOOP;
  EXCEPTION
  WHEN OTHERS THEN
    NULL;
  END;
  RETURN l_str;
EXCEPTION
WHEN OTHERS THEN
  RETURN 'ERROR';
END TEST_FUNC;
--
--+=============================================================================+
--| Description : function that performs the Replace for substitution strings   |
--|               used in the creation of the Selenium scripts                  |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--| S. Hunt         02-Jul-16 2       ClickAt added to AndWait commands         |
--+=============================================================================+
PROCEDURE TEST(
      p_spec_id IN NUMBER,
      p_case_id IN NUMBER,
      p_domain  IN VARCHAR2
  )
IS
  l_application_id NUMBER;
  l_test_name ataf_project.project_name%TYPE;
  l_test_case_old ataf_test_case.test_case%TYPE;
  l_theme_number NUMBER;
BEGIN
  -----------------------------------------
  -- Get project name and application id --
  -- as this might be called from a WS   --  
  -----------------------------------------
  IF p_spec_id IS NOT NULL  -- if a test spec is provided
    THEN
    SELECT tp.test_spec,
      p.application_id,
      aat.theme_number
    INTO l_test_name,
      l_application_id,
      l_theme_number
    FROM ataf_test_spec tp,
      ataf_project p,
      apex_application_themes aat
    WHERE tp.project_id = p.project_id
    AND tp.test_spec_id = p_spec_id
    AND p.application_id = aat.application_id
    AND aat.is_current = 'Yes'
    AND aat.ui_type_name = 'DESKTOP';
  ELSE                       -- if a test case is provided
    SELECT tc.test_case,
      p.application_id,
      aat.theme_number
    INTO l_test_name,
      l_application_id,
      l_theme_number
    FROM ataf_test_case tc,
      ataf_project p,
      apex_application_themes aat
    WHERE tc.project_id = p.project_id
    AND tc.test_case_id = p_case_id
    AND p.application_id = aat.application_id
    AND aat.is_current = 'Yes'
    AND aat.ui_type_name = 'DESKTOP';
  END IF;
  ----------------------
  -- Initialise table --
  ----------------------
    htp.p('<table cellpadding="1" cellspacing="1" border="1">');
    htp.p('<thead>');
    htp.p('<tr><td rowspan="1" colspan="3">'||apex_escape.html(l_test_name)||'</td></tr>');
    htp.p('</thead><tbody>');
      FOR i IN
  (
      ---------------------------------------------------------------
      WITH x AS
 -- 0 = cycle through data set
(
/***************************************************************
** Joins back to the test data table to get the defaul Group ID
** which is used if looping through the datasets    
***************************************************************/
SELECT
  x.test_case_id,
  x.sort_order,
  x.data_id,
  nvl(x.data_group_id,td.default_data_group_id) data_group_id
FROM
(
SELECT sc.test_case_id,
       sc.sort_order,
       sc.test_spec_id,
       ----------------------------------------------------------------
       -- If no data group is assigned in the Spec or the Case it being
       -- in isolation then use the default data group
       ----------------------------------------------------------------
       decode(sc.data_id,0,ad.data_id,sc.data_id) data_id,
       sc.data_group_id,
       tc.test_Data_id
  FROM ataf_spec_case sc
  JOIN ataf_test_case tc ON sc.test_case_id = tc.test_case_id
  LEFT OUTER JOIN ataf_data ad ON tc.test_data_id = ad.test_data_id
                            -- AND sc.data_group_id = ad.data_group_id
                               AND (sc.data_group_id = ad.data_group_id or sc.data_group_id IS NULL)
                               AND (sc.data_id = ad.data_id or sc.data_id = 0)
) x
  LEFT OUTER JOIN ataf_test_data td ON x.test_data_id = td.test_data_id
WHERE
  x.test_spec_id = p_spec_id    
/***************************************************************
** Below it the old code that does not filter test conditions **     
****************************************************************
 SELECT sc.test_case_id,
        sc.sort_order,
        decode(sc.data_id,0,ad.data_id,sc.data_id)  data_id,
        nvl(sc.data_group_id,0) data_group_id
  FROM ataf_spec_case sc
  JOIN ataf_test_case tc ON sc.test_case_id = tc.test_case_id
  LEFT OUTER JOIN ataf_data ad ON tc.test_data_id = ad.test_data_id
                              AND sc.data_group_id = ad.data_group_id
                              AND sc.data_id = 0
  WHERE sc.test_spec_id = p_spec_id
*****************************************************************/
  UNION ALL
  SELECT
        cas.test_case_id,
        0 sort_order,
        null data_id,
        dat.default_data_group_id data_group_id
  FROM
  ataf_test_case cas
  LEFT OUTER JOIN ataf_test_data dat ON cas.test_data_id = dat.test_data_id
  WHERE cas.test_case_id = p_case_id)
SELECT
    tcv.test_case,
    -------------
    -- Command --
    -------------
    CASE
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'click' THEN 'clickAndWait'
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'clickAt' THEN 'clickAtAndWait'
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'type' THEN 'typeAndWait'
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'select' THEN 'selectAndWait'
      ELSE sel.selenium_command
    END command,
    -------------
    -- Target --
    -------------
    CASE
        -- Custom
        -- e.g.WHEN se.row_key = 'AACO' THEN XYZ
        --Standard
      WHEN sel.item_attribute = 'DOM ID'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||tcv.dom_id
      WHEN sel.item_attribute = 'Name'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||tcv.name
      WHEN sel.item_attribute = 'Label'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||tcv.label
      WHEN sel.item_attribute = 'Data'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||nvl(tcv.data_item_value,tdv.data_item_value)
      ELSE nvl2(sel.location,sel.location
        ||'=',NULL)
        ||test_func( p_id => tcv.id, p_target => sel.target, p_dom_id => tcv.dom_id, p_name => tcv.name, p_label => tcv.label, p_data => nvl(tcv.data_item_value,tdv.data_item_value), p_page_title => tcv.page_title, p_element => tcv.element_type, p_application_id => tcv.application_id, p_page_id => tcv.page_id, p_row => tcv.row_number, p_region_id => tcv.region_id, p_region_name => tcv.region_name, p_domain => p_domain, p_outcome_page_id => tcv.outcome_page_id, p_outcome_page_title => tcv.outcome_page_title)
    END target,
    -----------
    -- Value --
    -----------
    CASE
      WHEN sel.data_yn = 'Y' THEN nvl(tcv.data_item_value,tdv.data_item_value) -- when selenium command is expecting data
      WHEN sel.data_yn = 'L' THEN 'label='||nvl(tcv.data_item_value,tdv.data_item_value) -- Prefix data with Label=
      WHEN sel.data_yn = 'A' THEN 'label='||tcv.label -- Prefix data with Label=
--      WHEN sel.data_yn = 'S' THEN '${'||nvl(tcv.data_item_value,tdv.data_item_value)||'}' -- Stored value
      ELSE NULL
    END value
    ----------
FROM
  ataf_test_condition_full_v tcv
  JOIN ataf_selenium sel ON tcv.action_id = sel.action_id
                        AND tcv.theme_number = sel.theme_number
  JOIN x ON tcv.test_case_id = x.test_case_id
  LEFT OUTER JOIN ataf_full_test_data_v tdv ON tcv.test_data_id   = tdv.test_data_id
                                           AND tcv.data_attribute = tdv.attribute      
                                           AND nvl(tdv.data_id,0) = nvl(x.data_id,0)
---------------------------------------------------------------
-- This sets the conditional display for the Test Conditions --    
---------------------------------------------------------------
WHERE
  tcv.data_group_id = x.data_group_id or tcv.data_group_id IS NULL
---------------------------------------------------------------
      
      
ORDER BY
  x.sort_order,
  x.data_id,
  tcv.con_sort_order,
  sel.sort_order
      ---------------------------------------------------------------
  )
  LOOP
    IF l_test_case_old IS NULL OR l_test_case_old != i.test_case THEN
      htp.p('<!--Test Case: '||i.test_case||'-->');
    END IF;
    htp.p('<tr>');
    htp.p('<td>'||apex_escape.html(i.command)||'</td>');
    htp.p('<td>'||apex_escape.html(i.target)||'</td>');
    htp.p('<td>'||apex_escape.html(i.value)||'</td>');
    htp.p('</tr>');
    l_test_case_old := i.test_case;
  END LOOP;
  htp.p('</tbody></table>');
END TEST;
--
--+=============================================================================+
--| Description : new version of apex_util.current_user_in_group to rtn varchar |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         17-Jul-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION current_user_in_group(
    p_group_name IN VARCHAR2) RETURN varchar2
IS
BEGIN
    IF APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name) = true THEN
      RETURN 'Y';
    ELSE
       RETURN 'N';
    END IF;
END current_user_in_group;
--
--+=============================================================================+
--| Description : returns test data columns                                     |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION return_cols RETURN VARCHAR2
IS
  lv_cols varchar2(4000);
BEGIN
  SELECT '::Group:Row Name:'||LISTAGG(data_item_name, ':') WITHIN GROUP (ORDER BY data_attribute) INTO lv_cols
  FROM ataf_data_item
  WHERE test_data_id = (SELECT nv('TEST_DATA_ID') FROM dual);
  RETURN lv_cols;
EXCEPTION when others THEN
  RETURN null;
END return_cols;
--
--+=============================================================================+
--| Description : returns the start date of the financial year                  |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION return_fy_start (p_date IN DATE) RETURN DATE
IS
    lv_date VARCHAR2(16);
BEGIN
      IF EXTRACT(month FROM p_date) > 3 then
        lv_date := '01-APR-'||to_char(p_date,'YYYY');  
      ELSE
        lv_date := '01-APR-'||to_char(EXTRACT(YEAR FROM p_date)-1);
      END IF;
      
      RETURN to_date(lv_date,'DD-MON-YYYY');
END return_fy_start;
--
--+=============================================================================+
--| Description : returns a random data item for a specified attribute number   |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         18-Aug-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION random_data (
      p_attribute    IN NUMBER,
      p_test_data_id IN NUMBER)
    RETURN VARCHAR
IS
  lv_val ataf_data.attribute_1%type;
BEGIN
  SELECT  decode(p_attribute,
    0,attribute_1,
    1,attribute_2,
    2,attribute_3,
    3,attribute_4,
    4,attribute_5,
    5,attribute_6,
    6,attribute_7,
    7,attribute_8,
    8,attribute_9,
    9,attribute_10,
    10,attribute_11,
    11,attribute_12,
    12,attribute_13,
    13,attribute_14,
    14,attribute_15,
    15,attribute_16,
    16,attribute_17,
    17,attribute_18,
    18,attribute_19,
    19,attribute_20,      
    null) val
  INTO lv_val
  FROM    (
           select * from ataf_data
           where test_data_id = p_test_data_id
           ORDER BY dbms_random.value
          )
  WHERE rownum = 1;
  RETURN lv_val;
END random_data;
--
--+=============================================================================+
--| Description : Pipleline function for return a separated list into a tavle   |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
FUNCTION ret_table(p_string VARCHAR2, p_separator VARCHAR2) RETURN ret_val_t
PIPELINED IS
l_vc_arr2 apex_application_global.vc_arr2;
BEGIN
l_vc_arr2 := apex_util.string_to_table(p_string, p_separator);
FOR z IN 1 .. l_vc_arr2.COUNT LOOP
PIPE ROW(l_vc_arr2(z));
END LOOP;
END ret_table;
END "ATAF_PKG";
/

CREATE OR REPLACE PACKAGE  "ATAF_DATA_GENERATOR" as
function ni_number 
    return varchar2;
function nhs_number
    return varchar2;
    
--
 --+============================================================================+
 --| Name        :  string_generator                                            |
 --|                                                                            |
 --| Description :  Chooses a random format mask from any csv-separated list and|
 --|                and generates a string based on those specifications        |
 --|                'N' for numbers, 'U' for uppercase letters, 'L' for lower   |
 --|                e.g. 'NNN-ULLL,UUU-NNNL,NUL-UNL' - function chooses one and |
 --|                returns compliant string. Also works with just 1 format mask|
 --|                Second parameter is the user-definable escape character     |
 --|                                                                            |
 --|                                                                            |
 --| Modification History :                                                     |
 --| ----------------------                                                     |
 --|                                                                            |
 --| Author             Date      Version   Remarks                             |
 --| ------------------ --------- --------- ------------------------------------|
 --| J. Shenton         02-Sep-15 1         Initial version                     |
 --+============================================================================+
FUNCTION string_generator (p_csv_formats_i IN VARCHAR2
                         , p_escape_char_i IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2;    
end;
/
CREATE OR REPLACE PACKAGE BODY  "ATAF_DATA_GENERATOR" is
function NI_NUMBER return VARCHAR2
as
  lv_pre VARCHAR2(2);
  lv_suf VARCHAR2(1);
  lv_bi1 varchar2(3);
  lv_bi2 varchar2(3);
  lv_bi3 varchar2(3);
  lv_no  NUMBER;
  lv_ni  VARCHAR2(13);
BEGIN
  WHILE 
    lv_pre IN ('BG','GB','KN','NK','NT','TN','ZZ') 
    OR substr(lv_pre,1,1) IN ('D','F','I','Q','U','V')
    OR substr(lv_pre,2,1) IN ('D','F','I','O','Q','U','V')
    OR lv_pre IS NULL 
  LOOP
    lv_pre := DBMS_RANDOM.STRING('U',2);
  END LOOP;
  lv_no := TRUNC(DBMS_RANDOM.VALUE(1, 5));
  lv_suf:= case lv_no
           when 1 THEN ' '
           when 2 then 'A'
           when 3 then 'B'
           when 4 then 'C'
           when 5 then 'D' END;
  lv_bi1 := TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(0, 99)),'00');
  lv_bi2 := TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(0, 99)),'00');
  lv_bi3 := TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(0, 99)),'00');
  
  lv_ni := lv_pre||lv_bi1||lv_bi2||lv_bi3||' '||lv_suf;
  RETURN lv_ni;
end NI_NUMBER;
function NHS_NUMBER return VARCHAR2
as
  lv_reg NUMBER;
  lv_num VARCHAR2(9);
  lv_chk NUMBER;
  lv_nhs VARCHAR2(100);
BEGIN
  --Choose Wales, Scotland, England or NI
  lv_reg := trunc(DBMS_RANDOM.VALUE(1, 3)); 
  IF lv_reg = 1 THEN
    lv_num := TRIM(TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(400000000, 499999999)),'000000000'));
  ELSIF lv_reg = 2 THEN
    lv_num := TRIM(TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(600000000, 708800001)),'000000000'));
  ELSIF lv_reg = 3 THEN
    lv_num := TRIM(TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(320000001, 399999999)),'000000000'));
  END IF;
  lv_chk :=   
  11-mod((to_number(substr(lv_num,1,1)) * 10)+
        (to_number(substr(lv_num,2,1)) * 9 )+
        (to_number(substr(lv_num,3,1)) * 8 )+
        (to_number(substr(lv_num,4,1)) * 7 )+
        (to_number(substr(lv_num,5,1)) * 6 )+
        (to_number(substr(lv_num,6,1)) * 5 )+
        (to_number(substr(lv_num,7,1)) * 4 )+
        (to_number(substr(lv_num,8,1)) * 3 )+
        (to_number(substr(lv_num,9,1)) * 2 ),11);
  lv_nhs := substr(lv_num,1,3)||'-'||substr(lv_num,3,3)||'-'||substr(lv_num,6,3)||lv_chk;
  RETURN lv_nhs;
end NHS_NUMBER;
--
 --+============================================================================+
 --| Name        :  string_generator                                            |
 --|                                                                            |
 --| Description :  Chooses a random format mask from any csv-separated list and|
 --|                and generates a string based on those specifications        |
 --|                'N' for numbers, 'U' for uppercase letters, 'L' for lower   |
 --|                e.g. 'NNN-ULLL,UUU-NNNL,NUL-UNL' - function chooses one and |
 --|                returns compliant string. Also works with just 1 format mask|
 --|                                                                            |
 --|                                                                            |
 --| Modification History :                                                     |
 --| ----------------------                                                     |
 --|                                                                            |
 --| Author             Date      Version   Remarks                             |
 --| ------------------ --------- --------- ------------------------------------|
 --| J. Shenton         02-Sep-15 1         Initial version                     |
 --+============================================================================+
FUNCTION string_generator (p_csv_formats_i IN VARCHAR2
                         , p_escape_char_i IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2
IS
lv_format_count NUMBER;
lv_position_choice NUMBER;
lv_chosen_format VARCHAR2(256);
lv_output_string VARCHAR2 (256);
lv_escape_flag NUMBER DEFAULT 0;
INVALID_ESCAPE_CHAR EXCEPTION;
BEGIN
    IF p_escape_char_i IN ('N','n', 'U', 'u', 'L', 'l', ',') --check for reserved letters being used to escape, a no-no
    OR LENGTH(p_escape_Char_i) > 1
    THEN RAISE INVALID_ESCAPE_CHAR;
    END IF;
    
    --1. Determine if there are multiple formats and select one at random
    --count the commas in the string, add 1, this is the number of formats
    lv_format_count := regexp_count(p_csv_formats_i, ',') + 1;
    
    IF lv_format_count = 1   --if there is only one format, generate the output using the entire input string
    THEN lv_chosen_format := p_csv_formats_i;--generate the string using the input format!
    ELSE      
        lv_position_choice := TRUNC(DBMS_RANDOM.VALUE(1,(lv_format_count + 1))); --select start point between 0 and format_count
        IF lv_position_choice = 1
        THEN lv_chosen_format:=  substr(p_csv_formats_i
                                      , 1
                                      , (instr(p_csv_formats_i,',',1)-1) ); --start at 1st position, go till CHAR before 1st comma
        ELSIF lv_position_choice = lv_format_count --last value in the list
        THEN lv_chosen_format:= substr(p_csv_formats_i
                                     , (instr(p_csv_formats_i,',',-1,1)+1) --start point, one character after the last comma
                                     , (length(p_csv_formats_i) -(instr(p_csv_formats_i,',', - 1))) --whole string length minus the position of last comma
                                       );--start at the last commma+1, run till the end
        ELSE lv_chosen_format:= substr(p_csv_formats_i
                                     , (instr(p_csv_formats_i,',',1, (lv_position_choice - 1)) + 1) --start point, the character after the preceding comma 
                                     , (instr(p_csv_formats_i,',',1, lv_position_choice) - (instr(p_csv_formats_i,',',1, (lv_position_choice-1)))) - 1 --length
                                       );
        END IF;
    END IF;
    --2. With a format mask selected, we can now generate the output
    FOR i IN 1..length(lv_chosen_format)
    LOOP
        IF lv_escape_flag = 0 --no escape flag, but character is the escape character
            AND substr(lv_chosen_format, i, 1) = p_escape_char_i
        THEN lv_escape_flag := 1; --set a flag for the next iteration
             CONTINUE;
        ELSIF lv_escape_flag = 1 
        THEN lv_output_string := lv_output_string || substr(lv_chosen_format, i, 1);
             lv_escape_flag := 0; --pass the escaped char through and move on        
        ELSE
            IF substr(lv_chosen_format, i, 1) IN ('N', 'n')   
                THEN lv_output_string := lv_output_string || To_char(TRUNC(DBMS_RANDOM.value(0,9)));
            ELSIF substr(lv_chosen_format, i, 1) IN ('U', 'u')
                THEN lv_output_string := lv_output_string || DBMS_RANDOM.STRING('U', 1);
            ELSIF substr(lv_chosen_format, i, 1) IN ('L', 'l')
                THEN lv_output_string := lv_output_string || DBMS_RANDOM.STRING('L', 1);
            ELSE lv_output_string := lv_output_string || substr(lv_chosen_format, i, 1);
            END IF;
        END IF;
            
    END LOOP;
     
    
RETURN lv_output_string;
EXCEPTION
WHEN INVALID_ESCAPE_CHAR
THEN RETURN 'AN invalid escape character was used, please use a single character, excluding N,n,U,u,L,l and '',''';
WHEN OTHERS
THEN RAISE;
END string_generator;
 
end "ATAF_DATA_GENERATOR";
/

 CREATE SEQUENCE   "ATAF_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 8674 CACHE 20 NOORDER  NOCYCLE
/
 CREATE SEQUENCE   "ATAF_DATA_GROUPS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE
/
CREATE OR REPLACE TRIGGER  "BI_ATAF_DATA_GROUPS" 
  before insert on "ATAF_DATA_GROUPS"               
  for each row  
begin   
  if :NEW."DATA_GROUP_ID" is null then 
    select "ATAF_DATA_GROUPS_SEQ".nextval into :NEW."DATA_GROUP_ID" from sys.dual; 
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
CREATE OR REPLACE FORCE VIEW "ATAF_APEX_PAGE_ITEMS" ("APPLICATION_ID", "PAGE_ID", "LABEL", "TYPE", "DOM_ID", "NAME", "DISPLAY_SEQUENCE", "ID", "ELEMENT_TYPE", "REGION_ID", "REGION_NAME", "DISPLAY_SEQUENCE1", "DISPLAY_SEQUENCE2") AS 
SELECT
 c001 APPLICATION_ID,
 c002 PAGE_ID,
 c003 LABEL,
 c004 TYPE,
 c005 DOM_ID,
 c006 NAME,
 c007 DISPLAY_SEQUENCE,
 c008 ID,
 c009 ELEMENT_TYPE,
 c010 REGION_ID,
 c011 REGION_NAME,
 c012 DISPLAY_SEQUENCE1,
 c013 DISPLAY_SEQUENCE2
FROM
  apex_collections
WHERE
  collection_name = 'APEX_PAGE_ITEMS'
/
CREATE OR REPLACE FORCE VIEW "ATAF_APEX_PAGE_ITEMS_V" ("APPLICATION_ID", "PAGE_ID", "LABEL", "TYPE", "DOM_ID", "NAME", "DISPLAY_SEQUENCE", "DISPLAY_SEQUENCE1", "DISPLAY_SEQUENCE2", "ID", "ELEMENT_TYPE", "PAGE_ALIAS", "REGION_ID", "REGION_NAME", "REGION_POSITION", "DISPLAY") AS 
  SELECT 
--
--+============================================================================
--|                     Apex Test Automation Framework
--|                                Andover
--+=============================================================================+
--|                                                                             |
--| $Author: $                                                                  |
--| $Date: $                                                                    |
--| $Revision: $                                                                |
--| $HeadURL: $                                                                 |
--|                                                                             |
--| Description : View of all apex and custom items drawn from apex views       |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--| S. Hunt         26-Jun-16 2       New display column added                  |
--|                                   ATAF_WORSPACE WHERE Clause added          |
--| S.Hunt          02-Jul-16 3       Changed Nav Bar to list item              |
--+=============================================================================+   
   ----------------
   -- List Items --
   ----------------
          ent.application_id,
          reg.page_id,

          case
            when reg.region_name = 'Header Quick Navigation' then ent.entry_text
            when ent.list_entry_parent_id is not null then '- '||ent.entry_text
            else ent.entry_text end label,
    
          decode(reg.region_name,'Header Quick Navigation','Nav Bar','List Item') TYPE,
          'L' || ent.list_entry_id dom_id,
          ent.entry_text name,
          ent.display_sequence,
          nvl(ent.list_entry_parent_id,ent.list_entry_id) display_sequence1,
          nvl2(ent.list_entry_parent_id,ent2.display_sequence,ent.display_sequence) display_sequence2,
          ent.list_entry_id id,
          'a' element_type,
          NULL page_alias,
          to_char(reg.region_id),
          reg.region_name,
          reg.display_position,
          decode (ent.condition_type, 'Never','N','Y') display
     FROM apex_application_list_entries ent
          join apex_application_lists lis ON ent.list_id = lis.list_id and ent.workspace = lis.workspace
          join apex_application_page_regions reg ON lis.list_id = reg.list_id and lis.workspace = reg.workspace
          left outer join apex_application_list_entries ent2 on ent.list_entry_parent_id = ent2.list_entry_id and ent.workspace = ent2.workspace
    WHERE ent.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)    
   UNION ALL
   ------------------------
   -- Sidebar Navigation --
   ------------------------
   SELECT 
          ent.application_id,
          0 page_id,
          SUBSTR(ent.entry_text,1,INSTR(ent.entry_text,'&')-2) label,
          'List Item' TYPE,
          'L' || ent.list_entry_id dom_id,
          ent.entry_text name,
          ent.display_sequence,
          null display_sequence1,
          null display_sequence2,
          ent.list_entry_id id,
          'a' element_type,
          null,
          null,
          'Sidebar Navigation',
          null,
          'Y' display
     FROM apex_application_list_entries ent
     JOIN APEX_APPL_USER_INTERFACES ui ON ent.application_id = ui.application_id
                                      AND ent.list_id = ui.navigation_list_id
                                      and ent.workspace = ui.workspace
     where ent.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)                                
     UNION ALL
   -----------------------------------
   -- Parent List Items Stores Only --
   -----------------------------------
     SELECT reg.application_id,
          reg.page_id,
          reg.region_name label,
          'Parent List Item' TYPE,
          to_char(lis.list_name) dom_id,
          lis.list_name name,
          reg.display_sequence,
          null display_sequence1,
          null display_sequence2,
          lis.list_id id,
          'a' element_type,
          NULL page_alias,
          to_char(reg.region_id) region_id,
          reg.region_name,
          reg.display_position,
          'Y' display
     FROM apex_application_lists lis,
          apex_application_page_regions reg
    WHERE reg.list_id = lis.list_id
      and reg.workspace = lis.workspace
      and reg.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   ------------------
   -- Custom Items --
   ------------------
   SELECT application_id,
          page_id,
          item_label label,
          item_type TYPE,
          item_dom_id,
          item_name name,
          display_sequence,
          null display_sequence1,
          null display_sequence2,
          item_id id,
          NULL element_type,
          NULL page_alias,
          NULL region_id,
          null region_name,
          null region_position,
          'Y' display
   FROM ataf_item
   UNION ALL
   -------------
   -- Nav Bar --
   -------------
/* Removed because navbar is now a list item
   SELECT 
          ent.application_id,
          0 page_id,
          ent.entry_text label,
          'Nav Bar' TYPE,
          'L' || ent.list_entry_id dom_id,
          ent.entry_text name,
          ent.display_sequence,
          null display_sequence1,
          null display_sequence2,
          ent.list_entry_id id,
          NULL,
          NULL page_alias,
          NULL region_id,
          'Nav Bar' region_name,
          'Nav Bar' region_position,
          'Y' display
     FROM apex_application_list_entries ent
     JOIN APEX_APPL_USER_INTERFACES ui ON ent.application_id = ui.application_id
                                      AND ent.list_id = ui.nav_bar_list_id
                                      and ent.workspace = ui.workspace
    where ent.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
*/
   -----------------
   -- Apex Items  --
   -----------------
   SELECT aapi.application_id,
          aapi.page_id,
          NVL (aapi.label, aapi.item_name),
          decode(aapi.display_as,'Text Field with autocomplete','Text Field',aapi.display_as) display_as,
          TO_CHAR (aapi.item_id) r,
          aapi.item_name,
          aapi.display_sequence,
          null display_sequence1,
          null display_sequence2,
          aapi.item_id,
          NULL,
          NULL page_alias,
          NULL region_id,
          aapi.region region_name,
          null region_position,
          case when aapi.display_as = 'Hidden' then 'N'
               when aapi.condition_type = 'Never' then 'N'
               else 'Y' end disply
     FROM apex_application_page_items aapi
    WHERE 
          aapi.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   -------------------
   -- Apex Buttons  --
   -------------------
   SELECT application_id,
          page_id,
          NVL (label, button_name),
          'Button',
          CASE
          WHEN button_static_id is not null THEN button_static_id
          WHEN button_position = 'Among region items' THEN button_name
          ELSE 'B' || button_id END,
          button_name,
          button_sequence,
          null display_sequence1,
          null display_sequence2,
          button_id,
          NULL,
          NULL page_alias,
          NULL region_id,
          region region_name,
          null region_position,
          decode(condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_page_buttons
    WHERE workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   ---------------
   -- Apex Tabs --
   ---------------
   SELECT a.application_id,
          0 page_id,
          tab_label,
          'Tab',
          TO_CHAR (a.tab_id),
          a.tab_name,
          a.display_sequence,
          null display_sequence1,
          null display_sequence2,
          a.tab_id,
          NULL,
          NULL page_alias,
          NULL region_id,
          'Tab Region' region_name,
          null region_position,
          decode(condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_tabs a
    WHERE a.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   -----------------
   -- IR Columns  --
   -----------------
   SELECT application_id,
          page_id,
          report_label,
          'Report Column',
          TO_CHAR (column_id),
          column_alias,
          display_order,
          null display_sequence1,
          null display_sequence2,
          column_id,
          NULL,
          NULL page_alias,
          to_char(interactive_report_id) region_id,
          'Interactive Report' region_name,
          null region_position,
          decode(display_condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_page_ir_col
    WHERE workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   --------------------
   -- Report Columns --
   --------------------
   SELECT application_id,
          page_id,
          NVL (heading, column_alias) label,
          'Report Column' TYPE,
          TO_CHAR (region_report_column_id) id,
          column_alias name,
          display_sequence,
          null display_sequence1,
          null display_sequence2,
          region_report_column_id,
          NULL,
          NULL page_alias,
          'datatable_R' || region_id region_id,
          region_name,
          null region_position,
          decode(condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_page_rpt_cols
    WHERE column_is_hidden = 'No'
      and workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   -------------------
   -- IR Components --
   -------------------
   SELECT aa.application_id,
          aa.page_id,
          ir.label,
          ir.TYPE,
          ir.dom_id dom_id,
          ir.dom_id name,
          ir.display_sequence,
          null display_sequence1,
          null display_sequence2,
          TO_NUMBER (aa.interactive_report_id || ir.id) id,
          NULL,
          NULL page_alias,
          to_char(aa.region_id) region_id,
          'Interactive Report' region_name,
          null region_position,
          'Y' display
     FROM (SELECT 'IR Search' label,
                  'IR Search' TYPE,
                  'apexir_SEARCH' dom_id,
                  10 display_sequence,
                  1 id,
                  NULL
             FROM DUAL
           UNION ALL
           --select
           --  'IR Go Button' label,
           --  'IR Go Button' type,
           --  'apexir_btn_SEARCH' dom_id,
           --  20 display_sequence,
           --  2 id    --from dual
           --union all
           SELECT 'IR Reset' label,
                  'IR Reset' TYPE,
                  'apexir_ACTIONSMENUROOT' dom_id,
                  30 display_sequence,
                  3 id,
                  NULL
             FROM DUAL
           UNION ALL
                    SELECT 'IR Saved Report' label,
                  'IR Saved Report' TYPE,
                  'apexir_SAVED_REPORTS' dom_id,
                  25 display_sequence,
                  5 id,
                  NULL
             FROM DUAL
           UNION ALL
           SELECT '** Link Column **' label,
                  'Report Column' TYPE,
                  'LINK' dom_id,
                  0 display_sequence,
                  4 id,
                  NULL
             FROM DUAL) ir,
          apex_application_page_ir aa
          where aa.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   --------------
   -- Outcomes --
   --------------
   SELECT NULL application_id,
          0 page_id,
          'Outcome' label,
          'Outcome' TYPE,
          NULL dom_id,
          NULL name,
          NULL display_sequence,
          null display_sequence1,
          null display_sequence2,
          NULL id,
          NULL element_type,
          NULL page_alias,
          NULL region_id,
          null region_name,
          null region_position,
          'Y' display
     FROM DUAL
   UNION ALL
   -----------------
   -- Global Item --
   -----------------
   SELECT NULL application_id,
          0 page_id,
          'Global Item' label,
          'Custom' TYPE,
          NULL dom_id,
          'Global Custom' name,
          NULL display_sequence,
          null display_sequence1,
          null display_sequence2,
          0 id,
          NULL element_type,
          NULL page_alias,
          NULL region_id,
          null region_name,
          null region_position,
          'Y' dislpay
     FROM DUAL
/
CREATE OR REPLACE FORCE VIEW  "ATAF_FULL_TEST_DATA_V" ("DATA_ID", "DATA_ITEM_ID", "ROW_NAME", "ROW_NUMBER", "ROW_KEY", "DATA_ITEM_VALUE", "TEST_DATA_ID", "LAST_UPDATED_DATE", "LAST_UPDATED_BY", "ATTRIBUTE", "DATA_ITEM_NAME", "DATA_GROUP_ID") AS 
  SELECT 
  x.data_id,
  di.data_item_id,
  x.row_name,
  x.row_number,
  x.row_key,
  case di.data_function
    when 1 then trim((case substr(di.parameter2,1,1) 
                    when 'D' THEN to_char(sysdate + x.data_item_value, di.parameter1)
                    when 'M' THEN to_char(add_months(sysdate,x.data_item_value), di.parameter1)
                    else to_char(add_months(sysdate,x.data_item_value*12), di.parameter1)
                END))
    --
    when 5 then to_char(ataf_pkg.return_fy_start(sysdate)+ x.data_item_value,di.parameter1)
    when 9 then to_char((add_months(ataf_pkg.return_fy_start(sysdate),12)-1)+ x.data_item_value ,di.parameter1)
    --
    when 10 then (case substr(di.parameter2,1,1) 
                    when 'D' THEN to_char(TRUNC (sysdate + x.data_item_value, 'Month'), di.parameter1)
                    when 'M' THEN to_char(TRUNC (add_months(sysdate, x.data_item_value), 'Month'), di.parameter1)
                    else to_char(TRUNC (add_months(sysdate, x.data_item_value*12), 'Month'), di.parameter1)
                 END)   
    when 11 then 
                 case when length(x.data_item_value) <= 2 then 
                      to_char(to_date(trunc(DBMS_RANDOM.VALUE(to_char(add_months(sysdate,-(12*x.data_item_value)),'J'),to_char(add_months(sysdate,-(12*x.data_item_value+1)-1),'J'))),'J'),di.parameter1)
                 else x.data_item_value end
    when 12 then nvl(ataf_pkg.random_data(di.data_attribute,di.test_data_id),x.data_item_value)
    when 13 then to_char(trunc(DBMS_RANDOM.VALUE(di.parameter1,x.data_item_value)),di.parameter2)
    when 14 then ataf_data_generator.string_generator(x.data_item_value,NVL(di.parameter1,'/'))
    when 15 then ataf_data_generator.nhs_number()
    when 16 then ataf_data_generator.ni_number()
    else x.data_item_value
  end data_item_value,
  x.test_data_id,
  x.last_updated_date,
  x.last_updated_by,
  x.attribute,
  x.data_item_name,
  x.data_group_id
FROM (
SELECT
  0 data_id,
  adi.data_item_id,
  'Default' row_name,
  0 row_number,
  adi.row_key,
  adi.data_item_value,
  adi.test_data_id,
  adi.last_updated_date,
  adi.last_updated_by,
  adi.data_attribute attribute,
  adi.data_item_name,
  atd.default_data_group_id data_group_id
FROM ataf_test_data atd
  JOIN ataf_data_item adi ON atd.test_data_id = adi.test_data_id 
UNION ALL
SELECT
  data_id,
  null,
  row_name,
  rownum,
  row_key,
  data_item_value,
  test_data_id,
  last_updated_date,
  last_updated_by,
  attribute,
  row_name,
  nvl(data_group_id, 0) data_group_id
FROM   ATAF_DATA
UNPIVOT (data_item_value FOR attribute IN (
  ATTRIBUTE_1 AS 0,
  ATTRIBUTE_2 AS 1,
  ATTRIBUTE_3 AS 2,
  ATTRIBUTE_4 AS 3,
  ATTRIBUTE_5 AS 4,
  ATTRIBUTE_6 AS 5,
  ATTRIBUTE_7 AS 6,
  ATTRIBUTE_8 AS 7,
  ATTRIBUTE_9 AS 8,
  ATTRIBUTE_10 AS 9,
  ATTRIBUTE_11 AS 10,
  ATTRIBUTE_12 AS 11,
  ATTRIBUTE_13 AS 12,
  ATTRIBUTE_14 AS 13,
  ATTRIBUTE_15 AS 14,
  ATTRIBUTE_16 AS 15,
  ATTRIBUTE_17 AS 16,
  ATTRIBUTE_18 AS 17,
  ATTRIBUTE_19 AS 18,
  ATTRIBUTE_20 AS 19
))) x
JOIN ataf_data_item di ON x.test_data_id = di.test_data_id AND x.attribute = di.data_attribute
/
CREATE OR REPLACE FORCE VIEW "ATAF_TEST_CONDITION_FULL_V" ("ROW_KEY", "DATA_ITEM_ID", "DATA_ID", "TEST_COND_ID", "ROW_NUMBER", "CON_SORT_ORDER", "PAGE_ID", "OUTCOME_PAGE_ID", "ACTION_ID", "DATA_ATTRIBUTE", "TEST_DATA_ID", "TEST_CASE_ID", "TEST_CASE", "NOTES", "ID", "DOM_ID", "NAME", "LABEL", "ELEMENT_TYPE", "REGION_ID", "REGION_NAME", "SCRIPT", "ACTION", "DATA_ITEM_VALUE", "DATA_ITEM_NAME", "PAGE_TITLE", "OUTCOME_PAGE_TITLE", "THEME_NUMBER", "APPLICATION_ID", "PROJECT_ID", "DATA_GROUP_ID", "AND_WAIT") AS 
  SELECT
  ac.row_key,
  con.data_item_id,
  con.data_id,
  con.test_cond_id,
  con.row_number,
  con.sort_order con_sort_order,
  con.page_id,
  con.outcome_page_id,
  con.action_id,
  -- con.outcome_id,
  con.data_attribute,
  tc.test_data_id,
  tc.test_case_id,
  tc.test_case,
  tc.notes,
  iv.id,
  iv.dom_id,
  iv.name,
  iv.label,
  iv.element_type,
  iv.region_id,
  iv.region_name,
  ac.script,
  ac.action,
  -- ac1.script outcome_script,
  -- ac1.action action_outcome,
  di.data_item_value,
  di.data_item_name,
  pv.page_title,
  pv2.page_title outcome_page_title,
  aa.theme_number,
  aa.application_id,
  pr.project_id,
  con.data_group_id,
  ac1.and_wait
FROM
  -- Use ataf_test_cond_full_v if outcomes are reqd on separate rows ataf_test_cond for the same row
  ataf_test_cond_full_v con
  LEFT OUTER JOIN ataf_test_case tc                ON con.test_case_id = tc.test_case_id
--  LEFT OUTER JOIN ataf_test_data td                ON tc.test_data_id = td.test_data_id
  JOIN ataf_project pr                             ON tc.project_id = pr.project_id
  LEFT OUTER JOIN apex_application_themes aa       ON pr.application_id = aa.application_id and ui_type_NAME = 'DESKTOP'
                                                      and aa.workspace = v('ATAF_WORKSPACE')
  JOIN ataf_action ac                              ON con.action_id = ac.action_id
  LEFT OUTER JOIN ataf_action ac1                  ON con.outcome_id = ac1.action_id
  -- For prod change to ataf_apex_page_items for dev use ataf_apex_page_items_v
  LEFT OUTER JOIN ataf_apex_page_items iv          ON (con.apex_item_id = iv.id AND con.page_id = decode(iv.page_id,0,con.page_id,iv.page_id))
--------------------------------------------------------------------------------------------
  LEFT OUTER JOIN ataf_full_test_data_v di         ON con.data_item_id = di.data_item_id
                                                  AND con.data_id = di.data_id
---------------------------------------------------------------------------------------------
  LEFT OUTER JOIN apex_application_pages pv        ON con.page_id = pv.page_id and pr.application_id = pv.application_id
                                                      and pv.workspace = v('ATAF_WORKSPACE')
  LEFT OUTER JOIN apex_application_pages pv2       ON con.outcome_page_id = pv2.page_id and pr.application_id = pv2.application_id
                                                      and pv2.workspace = v('ATAF_WORKSPACE')
--WHERE di.data_group_id = td.default_data_group_id
--    OR td.default_data_group_id IS NULL
/
CREATE OR REPLACE FORCE VIEW "ATAF_TEST_CONDITION_V" ("DATA_ITEM_ID", "DATA_ID", "TEST_COND_ID", "ROW_NUMBER", "CON_SORT_ORDER", "PAGE_ID", "OUTCOME_PAGE_ID", "ACTION_ID", "OUTCOME_ID", "DATA_ATTRIBUTE", "TEST_DATA_ID", "TEST_CASE_ID", "TEST_CASE", "NOTES", "ID", "DOM_ID", "NAME", "LABEL", "ELEMENT_TYPE", "REGION_ID", "REGION_NAME", "SCRIPT", "ACTION", "OUTCOME_SCRIPT", "ACTION_OUTCOME", "DATA_ITEM_VALUE", "DATA_ITEM_NAME", "PAGE_TITLE", "OUTCOME_PAGE_TITLE", "THEME_NUMBER", "APPLICATION_ID", "PROJECT_ID", "DATA_GROUP_ID", "ROW_KEY", "ERROR") AS 
  SELECT
  con.data_item_id,
  con.data_id,
  con.test_cond_id,
  con.row_number,
  con.sort_order con_sort_order,
  con.page_id,
  con.outcome_page_id,
  con.action_id,
  con.outcome_id,
  con.data_attribute,
  tc.test_data_id,
  tc.test_case_id,
  tc.test_case,
  tc.notes,
  iv.id,
  iv.dom_id,
  iv.name,
  iv.label,
  iv.element_type,
  iv.region_id,
  iv.region_name,
  ac.script,
  ac.action,
  ac1.script outcome_script,
  ac1.action action_outcome,
  di.data_item_value,
  di.data_item_name,
  pv.page_title,
  pv2.page_title outcome_page_title,
  aa.theme_number,
  aa.application_id,
  pr.project_id,
  nvl(con.data_group_id,0) data_group_id,
  ac.row_key,
  case when con.apex_item_id is not null and iv.id is null then 'Error'
  else null end error
FROM
  ataf_test_cond con
  LEFT OUTER JOIN ataf_test_case tc                ON con.test_case_id = tc.test_case_id
  JOIN ataf_project pr                             ON tc.project_id = pr.project_id
  JOIN apex_applications aa                        ON pr.application_id = aa.application_id
                                                      AND aa.workspace = (select v('ATAF_WORKSPACE') x from dual)
  JOIN ataf_action ac                              ON con.action_id = ac.action_id
  -- For prod change to ataf_apex_page_items for dev use ataf_apex_page_items_v
  LEFT OUTER JOIN ataf_apex_page_items iv          ON (con.apex_item_id = iv.id AND con.page_id = decode(iv.page_id,0,con.page_id,iv.page_id))
--
  LEFT OUTER JOIN ataf_full_test_data_v di         ON con.data_item_id = di.data_item_id
                                                  AND con.data_id = di.data_id
--
--LEFT OUTER JOIN ataf_full_test_data_v di
--ON con.data_item_id = di.data_item_id
--OR con.data_id = di.data_id
--OR con.data_group_id = di.data_group_id    
--    
  LEFT OUTER JOIN ataf_action ac1                  ON con.outcome_id = ac1.action_id
  LEFT OUTER JOIN apex_application_pages pv        ON con.page_id = pv.page_id and pr.application_id = pv.application_id
                                                      AND pv.workspace = v('ATAF_WORKSPACE')
  LEFT OUTER JOIN apex_application_pages pv2       ON con.outcome_page_id = pv2.page_id and pr.application_id = pv2.application_id
                                                      AND pv2.workspace = v('ATAF_WORKSPACE')
/
CREATE OR REPLACE FORCE VIEW  "ATAF_TEST_COND_FULL_V" ("DATA_ID", "TEST_COND_ID", "TEST_CASE_ID", "DATA_ITEM_ID", "ACTION_ID", "OUTCOME_PAGE_ID", "APEX_ITEM_ID", "SORT_ORDER", "PAGE_ID", "ROW_NUMBER", "LAST_UPDATED_DATE", "LAST_UPDATED_BY", "ROW_KEY", "ROW_VERSION_NUMBER", "DATA_ATTRIBUTE", "DATA_GROUP_ID", "TYPE", "OUTCOME_ID") AS 
  select
 DATA_ID,
 TEST_COND_ID,
 TEST_CASE_ID,
 DATA_ITEM_ID,
 ACTION_ID,
 OUTCOME_PAGE_ID,
 APEX_ITEM_ID,
 SORT_ORDER,
 PAGE_ID,
 ROW_NUMBER,
 LAST_UPDATED_DATE,
 LAST_UPDATED_BY,
 ROW_KEY,
 ROW_VERSION_NUMBER,
 /*+DATA_ATTRIBUTE*/ DATA_ATTRIBUTE,
 DATA_GROUP_ID,
 'Action' TYPE,
 OUTCOME_ID
 from ATAF_TEST_COND
UNION ALL
select
 DATA_ID,
 TEST_COND_ID,
 TEST_CASE_ID,
 DATA_ITEM_ID,
 OUTCOME_ID ACTION_ID,
 OUTCOME_PAGE_ID,
 APEX_ITEM_ID,
 sort_order + 0.5 sort_order,
 PAGE_ID,
 ROW_NUMBER,
 LAST_UPDATED_DATE,
 LAST_UPDATED_BY,
 ROW_KEY,
 ROW_VERSION_NUMBER,
 /*+DATA_ATTRIBUTE*/ DATA_ATTRIBUTE,
 DATA_GROUP_ID,
 'Outcome' TYPE,
  null
 from ATAF_TEST_COND
WHERE outcome_id IS NOT NULL
/

--APEX_UTIL.CREATE_USER_GROUP(p_group_name => 'ataf_administrator');

INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (38916469500064392731477121354893922978, 'Text Field', q'!Click Image Post Element Text!', 'AB7R', q'!Click the image at the end of the text field #LABEL#!', '', q'!Useful for custom popups, this action clicks an image in the post element text of a text field. An outcome is normally required for this action.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (51649116603185119863522322475078673144, 'Outcome', q'!Tabular Form New Row Added!', 'AFQD', q'!New Blank Row is Added to the Bottom of the Tabular Form!', '', q'!New Blank Row is Added to the Bottom of the Tabular Form!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (38916469500078899841312496904990397090, 'Outcome', q'!Custom Popup Window Closes!', 'AB8O', q'!Custom Popup window closes!', '', q'!For use when closing a popup window, this action re-selects the parent window ready for the next action.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567529469909689498052667122844, 'Report Column', q'!Tabular Form Select!', 'AABG', q'!In the region '#REGION NAME#' select '#DATA#' from the select list in row #ROW# column '#NAME#' !', 'Y', q'!This tabular form action selects a select list value based on the associated data. The data value can be either the actual value or the numeric position. For the numeric position use "index=0", with 0 being the first value. No outcome is required and the row should be specified. This also works for new rows in out of the box tab forms, which have an additional b tag.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23858542572657611711134553767736801780, 'File Browse...', q'!File Browse!', 'AAAZ', q'!In the region '#REGION NAME#' search for the file named '#DATA#' in the file browse labelled '#LABEL#'!', 'Y', q'!This action does the equivalent of searching for a file in the file system and returning it to the file browse item. The file name is taken from the associated Data. Note the file name will need to include the full path e.g. C:\Users\Public\Pictures\femalePic.jpg.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23858542572661238488593397655260920308, 'IR Reset', q'!IR Reset!', 'AAA0', q'!Click 'Reset' in the Interactive Reports 'Actions' menu!', '', q'!Clicks the reset link in the Interactive Report Actions menu. No Outcome required.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23858542572669700969330700059483863540, 'IR Search', q'!IR Search!', 'AAA1', q'!Type '#DATA#' into the interactive Report search field and click the 'Go' button!', 'Y', q'!Performs a global search of the Interactive Report using the associated data item. In effect, typing the data into the search field and clicking "Go". There is no need for an Outcome.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567472650396167610481455932572, 'List Manager', q'!Add to List Manager!', 'AAA3', q'!Add value '#DATA# ' to the '#LABEL#' List Manager!', 'Y', q'!Adds the associated data vale to the list manager item. No outcome is required.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567484739654363756773202994332, 'Nav Bar', q'!Click Nav Bar Item!', 'AAA4', q'!Click the '#LABEL#' link in the Nav Bar!', '', q'!Clicks a link in the navigation bar. This should be followed by an Outcome except for perhaps the Log Out link.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (72669278025794961974934882451665034125, 'Nav Bar', q'!Click Nav Bar Child!', 'AG1Z', q'!In the Navbar drop down menu click on '#NAME#'!', '', q'!Clicks the child of a Navbar menu item.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567487157506002986031552406684, 'Number Field', q'!Type into Number Field!', 'AAA5', q'!In the region '#REGION NAME#' type #DATA# into the '#LABEL#' Number Field!', 'Y', q'!Types a number into the number field using the associated data.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567489575357642215289901819036, 'Outcome', q'!Branch to Page!', 'AAA6', q'!Branch to Page #OUTCOME PAGE ID# titled '#OUTCOME PAGE TITLE# '!', '', q'!Branches to another page and adds a "wait for page load" to the action. The action also verifies that the destination page title is correct.!', 'Y');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567494411060920673806600643740, 'Outcome', q'!Branch to Page with Confirmation!', 'AAA8', q'!Branch to Page #OUTCOME PAGE ID# titled '#OUTCOME PAGE TITLE# ' and display success message!', '', q'!The same as 'Branch to Page' but verifies that a success message is displayed.!', 'Y');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (39024396043902260365281875927588938329, 'Enkitec Modal LOV', q'!Click Enkitec Modal LOV!', 'AB9O', q'!Click on Entkitec Modal LOV and select #DATA#!', 'Y', q'!The Enkitec Modal LOV is an Apex plugin that uses Ajax and JQuery to deliver an advanced popup lov with multiple columns to search and filter on. This Action opens the Entkitec Modal LOV, searches for a value and returns it. No Outcome is normally associated with this action unless triggered by an onChange event in the calling item.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567502873541657976210823586972, 'Popup LOV', q'!Click Popup LOV!', 'AABB', q'!In the region '#REGION NAME#' select '#DATA#' into the popup LOV labelled '#LABEL#'!', 'Y', q'!This action selects a value from a popup LOV using the associated data. It is a complete action and does not require an outcome unless the calling item onChange event.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567512544948214893244221236380, 'Radio Group', q'!Click Radio Group!', 'AABC', q'!In the region '#REGION NAME#' select '#DATA#' in the radio group labelled '#LABEL#'!', 'Y', q'!The action clicks a value in a radio group. This is based on a number in the associated data with 0 being the first value.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567519798503132581019269473436, 'Report Column', q'!Tabular Form Popup LOV!', 'AABF', q'!In the region '#REGION NAME#' select '#DATA#' into the popup LOV of row #ROW# column '#NAME#'!', 'Y', q'!This tabular form action selects the popup lov value based on the associated data. No outcome is required and the row should be specified.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567539141316246415086064772252, 'Report Column', q'!Tabular Form Type Text!', 'AABJ', q'!In the region '#REGION NAME#' type '#DATA#' into the text field of row #ROW# column '#NAME#' !', 'Y', q'!This action types text from the associated data into the tabular form text field and the row should be specified. This also works for new rows in out of the box tab forms, which have an additional b tag.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567541559167885644344414184604, 'Select List', q'!Select from Select List - by position!', 'AABK', q'!In the region '#REGION NAME#' select '#DATA#' from the select list!', 'Y', q'!This action selects a value from the select list based on the position defined in the associated data. There is a generic list of Select List items available in the data, which can also be randomized which helps reduce the "pesticide" effect.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567543977019524873602763596956, 'Tab', q'!Click Tab!', 'AABL', q'!Click the tab labelled '#LABEL#'!', '', q'!Clicks a tab. An outcome is normally required for this action.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (25311739449363854956765440773390861682, 'Date Picker', q'!Type into Date!', 'AADN', q'!In the report '#REGION NAME#' type '#DATA#' into the date field!', 'Y', q'!Types the date from the associated data into the date field. This action does not use the data picker and will fail if the date field is un-editable.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (25311739449366272808404670031740274034, 'Select List', q'!Select from Cascading Select List!', 'AADO', q'!In the region '#REGION NAME#' select '#DATA#' from the cascading select list!', 'Y', q'!Same as the 'Select List by Position', but allows for the Ajax Loader image to disappear and therefore refresh the dependent select list. This action applies to the parent select list, not the child.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567546394871164102861113009308, 'Text Field', q'!Type into Text Field!', 'AABM', q'!In the region '#REGION NAME#' type '#DATA#' into the '#LABEL#' field!', 'Y', q'!Types text into a text field using the associated data. No outcome is normally required unless the calling item has an onChange event.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (208308240883443340181328343492199840493, 'Outcome', q'!Custom Popup Window Opens!', 'AF0K', q'!Custom Popup Window Opens!', '', q'!!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23877022567548812722803332119462421660, 'Textarea', q'!Type into Text Area!', 'AABN', q'!In the region '#REGION NAME#' type '#DATA#' into the '#LABEL# ' text area!', 'Y', q'!Types text into a text area using the associated data. No outcome is normally required unless the calling item has an onChange event.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23958696646134081405241812704752094938, 'Password', q'!Open Page!', 'AABO', q'!Open Page on URL '#DOMAIN#/app/f?p=#APP ID#:#APP ID#'!', 'Y', q'!Opens a page in the application associated with the current project using a page id specified in the Data.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (25326954274754567340258212417028251306, 'List Item', q'!Click List Item!', 'AADP', q'!In the region '#REGION NAME#' click on the '#NAME#' list item!', '', q'!Clicks any List Item both parent and child. If a child List Item, this action should be preceded by an action to click the parent and an outcome to open the child. For home menus, use the Home Menu "Click Child Drop Down". This action should be followed by an Outcome.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23568505336838258347966380065345778416, 'Button', q'!Click Button!', 'AAAB', q'!In the region '#REGION NAME#' click the '#LABEL#' button!', '', q'!Used for clicking any apex button except those that have JavaScript alerts such as Delete buttons.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23806937381602042057724267858753550183, 'Checkbox', q'!Select Checkbox Value!', 'AAAY', q'!In the region #REGION NAME# tick the '#LABEL#' checkbox!', 'Y', q'!Clicks a Checkbox with a label specified in the Data. If the Checkbox is already checked this function will uncheck it.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (24614709493656105474533386000533617397, 'Custom', q'!SSO Click Login Button!', 'AAC5', q'!Click on the SSO Login Button!', '', q'!A very specific action that is used to click the Login button on the Single Sign On (SSO) login page and wait for the Westminster home page to load.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (35754179409484724920771295053231424376, 'List Item', q'!Click Home Menu Child List dropdown!', 'AAGF', q'!From the Home page click the '#NAME#' icon child list!', '', q'!Clicks the the drop down menu icon to the right of the images on the home page. Should be followed by an Outcome 'Child Menu Open', which will pause for enough time for the child menu to open. It is possible to click the link under the home menu icon by using the action 'Click List Item' and select the parent menu item e.g. Home Menu - Administration.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (25524938314995724863598986592767708485, 'Report Column', q'!Tabular Form Checkbox!', 'AAES', q'!In the region '#REGION NAME#' tick the '#LABEL#' tabular form checkbox!', '', q'!This action check a tabular form checkbox item using the value in the associated data. The value should be numeric with 0 being the first value and the row should be specified.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (44898086252051979548796989709389686565, 'Outcome', q'!Child Menu Opens!', 'AEGM', q'!Child menu opens!', '', q'!Pauses for enough time for the child menu to open.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (36306567266338313428621755856336209150, 'Report Column', q'!Click Report Column by Row!', 'ABWA', q'!In the region '#REGION NAME#' click row #ROW# in the report column '#NAME#'!', '', q'!Clicks a report column link or image contained in the anchor tag of the table cell. An outcome is required and the row should be specified.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (37146736791867621121281112843948689499, 'Select List', q'!Select from Select List - by value!', 'ABZR', q'!In the region '#REGION NAME#' select '#DATA#' from the select list!', 'Y', q'!This action selects a value from the select list based on the value in the associated data. If the select list values are update-able then using the 'Select from Select List - by position' can be more stable, plus it reduces the volume of data required to support the test condition.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (39850340506468507171491174461661554066, 'Display Only', q'!Store Value from Text Display Only!', 'ACOS', q'!Store the value from #LABEL# in parameter '{#DATA#}'!', 'Y', q'!This stores the value from the specified display field in a variable named in the associated data. This stored value can be used later with the action 'Return Stored Value'.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (51867184663060633588295634754302159719, 'Outcome', q'!Show hidden items!', 'AFS5', q'!Hidden items displayed on screen!', '', q'!Hidden items displayed by dynamic actions or JavaScript are displayed on screen.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23765045923433393552828924942589384341, 'Button', q'!Click Button with Delete Message!', 'AAAX', q'!In the region '#REGION NAME#' click the delete button labelled '#LABEL#'!', '', q'!Used for clicking any apex delete button with a JavaScript confirm message. The action checks the content of the message is consistent with the application delete message and automatically clicks OK.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (23879673651420019712993353029447073345, 'Password', q'!Type into Password!', 'AABA', q'!In the region '#REGION NAME#' type '#DATA#' into the '#LABEL# ' password field!', 'Y', q'!Types a password into a password field using the associated data. Currently passwords are not hashed in the DB and are displayed in clear in the scripts. It is planned to change this in the future.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (25425926765693112441055680575750336518, 'Button', q'!Click Button and Any Confirm Alert!', 'AAD7', q'!In the region '#REGION NAME#' click the '#LABEL#' button and then click 'Ok' in the confirmation alert!', '', q'!Used for clicking any apex button that has a JavaScript confirm message. The action does not check the content of the message and automatically clicks OK.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (36312059334590488260560478035597345548, 'Outcome', q'!Modal Dialog Close!', 'ABVY', q'!Close Dialog Window #REGION NAME#.!', '', q'!This action adds a pause to allow time for a JQuery modal window to close.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (36312059334586861483101634148073227020, 'Outcome', q'!Modal Dialog Open!', 'ABVT', q'!Modal Dialog Window Opens!', '', q'!Waits for a JQuery modal dialog window to open. The modal must have an element with an id = "popup" in order for the action to work. If the modal includes an iFrame containing a page using the popup template then this will already exist. If the modal is based on a div element on the same page then an element with an id = "popup" might need to be added.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (24584088819588366946734332745533658472, 'Custom', q'!Type into Custom Text Field!', 'AAC3', q'!Type '#DATA#' into the '#NAME#' Text Field!', 'Y', q'!Types into a custom item of type Text Field using the DOM_ID to identify the element.!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (42567222942124753238125990658168601364, 'IR Saved Report', q'!IR Select Saved Report!', 'ADI5', q'!Select Saved IR Report #DATA#.!', 'Y', q'!Selects a saved interactive report by the report name taken from the associated data. No outcome is required!', '');
INSERT INTO ataf_action (action_id, item_type, action, row_key, script, data_yn, notes, and_wait) VALUES (245412815083420034421939206446694980736, 'Text Field', q'!Store Value from Text Field!', 'AF4R', q'!Store the value from #LABEL# in parameter '{#DATA#}'!', 'Y', q'!This stores the value from the specified text field in a variable named in the associated data. This stored value can be used later with the action 'Return Stored Value'.!', '');

INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023798650877669990356714839811, q'!type!', 24584088819588366946734332745533658472, 'Y', 'xpath', q'!//input[@id='#DOM_ID#']!', 'Target', 'AIGH', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023801068729309219615064252163, q'!waitForElementPresent!', 39024396043902260365281875927588938329, 'N', 'id', q'!superlov-fetch-results!', 'Target', 'AIGJ', 7, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023802277655128834244238958339, q'!waitForElementNotPresent!', 39024396043902260365281875927588938329, 'N', 'id', q'!superlov-loading-image!', 'Target', 'AIGK', 6, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023803486580948448873413664515, q'!pause!', 39024396043902260365281875927588938329, 'N', '', q'!3000!', 'Target', 'AIGL', 3, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023804695506768063502588370691, q'!select!', 42567222942124753238125990658168601364, 'Y', 'id', q'!!', 'DOM ID', 'AIGM', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023807113358407292760937783043, q'!pause!', 51649116603185119863522322475078673144, 'N', '', q'!2000!', '', 'AIGO', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023813157987505365906811313923, q'!pause!', 51867184663060633588295634754302159719, 'N', '', q'!2000!', '', 'AIGT', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023639072669480859305653624579, q'!type!', 25311739449363854956765440773390861682, 'Y', 'id', q'!!', 'Name', 'AICT', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023640281595300473934828330755, q'!select!', 25311739449366272808404670031740274034, 'Y', 'id', q'!!', 'Name', 'AICU', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023641490521120088564003036931, q'!waitForNotVisible!', 25311739449366272808404670031740274034, 'N', 'xpath', q'!//span[@class="apex-loading-indicator"]!', 'Target', 'AICV', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023642699446939703193177743107, q'!click!', 38916469500064392731477121354893922978, 'N', 'xpath', q'!//input[@id='#NAME#']/following-sibling::a[1]/img!', 'Target', 'AICW', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023643908372759317822352449283, q'!selectWindow!', 38916469500078899841312496904990397090, 'N', '', q'!null!', '', 'AICX', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023647535150218161709876567811, q'!pause!', 42567222942124753238125990658168601364, 'N', '', q'!1000!', '', 'AIC0', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023648744076037776339051273987, q'!waitForElementNotPresent!', 42567222942124753238125990658168601364, 'N', 'xpath', q'!//span[@id='apexir_LOADER' and contains(@style,'display: block')]!', '', 'AIC1', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023654788705135849484924804867, q'!pause!', 23877022567494411060920673806600643740, 'N', '', q'!3000!', '', 'AIC6', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023658415482594693372448923395, q'!pause!', 23877022567489575357642215289901819036, 'N', '', q'!3000!', '', 'AIC9', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023659624408414308001623629571, q'!type!', 39024396043902260365281875927588938329, 'Y', 'id', q'!superlov-filter!', 'Target', 'AIDA', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023660833334233922630798335747, q'!click!', 39024396043902260365281875927588938329, 'N', 'xpath', q'!//button[contains(@class,'superlov-modal-open')]!', 'Target', 'AIDB', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023662042260053537259973041923, q'!click!', 39024396043902260365281875927588938329, 'N', 'css', q'!span.ui-icon.ui-icon-circle-zoomin!', 'Target', 'AIDC', 4, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023663251185873151889147748099, q'!pause!', 39024396043902260365281875927588938329, 'N', '', q'!3000!', 'Target', 'AIDD', 5, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023664460111692766518322454275, q'!type!', 23877022567502873541657976210823586972, 'Y', 'id', q'!SEARCH!', 'Target', 'AIDE', 4, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023665669037512381147497160451, q'!clickAndWait!', 23877022567502873541657976210823586972, 'N', 'xpath', q'!//input[@value='Search']!', 'Target', 'AIDF', 5, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023666877963331995776671866627, q'!selectWindow!', 23877022567502873541657976210823586972, 'N', '', q'!!', '', 'AIDG', 8, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023668086889151610405846572803, q'!click!', 25326954274754567340258212417028251306, 'N', 'xpath', q'!//a[contains(text(),'#LABEL#')]!', '', 'AIDH', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023669295814971225035021278979, q'!click!', 39024396043902260365281875927588938329, 'N', 'xpath', q'!//table[@id='superlov-fetch-results']/tbody/tr/td!', 'Target', 'AIDI', 8, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023670504740790839664195985155, q'!waitForElementPresent!', 39024396043902260365281875927588938329, 'N', 'xpath', q'!//button[contains(@class,'superlov-modal-open')]!', 'Target', 'AIDJ', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023671713666610454293370691331, q'!echo!', 39850340506468507171491174461661554066, 'N', '', q'!Value store = ${#DATA#}!', '', 'AIDK', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023672922592430068922545397507, q'!pause!', 44898086252051979548796989709389686565, 'N', '', q'!2000!', '', 'AIDL', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023674131518249683551720103683, q'!pause!', 23858542572661238488593397655260920308, 'N', '', q'!2000!', '', 'AIDM', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023675340444069298180894809859, q'!waitForElementNotPresent!', 23858542572661238488593397655260920308, 'N', 'id', q'!apex_wait_popup!', '', 'AIDN', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023677758295708527439244222211, q'!type!', 23858542572657611711134553767736801780, 'Y', 'id', q'!!', 'Name', 'AIDP', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023678967221528142068418928387, q'!runScript!', 23858542572661238488593397655260920308, 'N', '', q'!$("##REGION ID#_ir").data("apex-interactiveReport")._reset();!', '', 'AIDQ', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023682593998986985955943046915, q'!type!', 23858542572669700969330700059483863540, 'Y', 'id', q'!R#REGION ID#_search_field!', '', 'AIDT', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023683802924806600585117753091, q'!click!', 23858542572669700969330700059483863540, 'N', 'id', q'!R#REGION ID#_search_button!', '', 'AIDU', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023685011850626215214292459267, q'!waitForElementPresent!', 23858542572669700969330700059483863540, 'N', 'xpath', q'!//span[contains(@id, 'control_text_') and contains(text(),'#DATA#')]!', '', 'AIDV', 4, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023686220776445829843467165443, q'!click!', 23877022567472650396167610481455932572, 'N', '', q'!css=img.uPopupLOVIcon!', '', 'AIDW', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023687429702265444472641871619, q'!waitForPopUp!', 23877022567472650396167610481455932572, 'N', '', q'!winLovList!', '', 'AIDX', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023688638628085059101816577795, q'!selectWindow!', 23877022567472650396167610481455932572, 'N', '', q'!!', '', 'AIDY', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023689847553904673730991283971, q'!selectWindow!', 23877022567472650396167610481455932572, 'N', 'name', q'!winLovList!', '', 'AIDZ', 3, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023691056479724288360165990147, q'!type!', 23877022567472650396167610481455932572, 'Y', '', q'!id=SEARCH!', '', 'AID0', 4, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023692265405543902989340696323, q'!click!', 23877022567472650396167610481455932572, 'Y', 'link', q'!!', 'Data', 'AID1', 5, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023693474331363517618515402499, q'!assertElementNotPresent!', 23877022567472650396167610481455932572, 'N', '', q'!winLovList!', '', 'AID2', 6, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023694683257183132247690108675, q'!selectWindow!', 23877022567472650396167610481455932572, 'N', '', q'!!', '', 'AID3', 7, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023695892183002746876864814851, q'!click!', 23877022567472650396167610481455932572, 'N', '', q'!css=input[type="button"]!', '', 'AID4', 8, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023697101108822361506039521027, q'!click!', 23877022567484739654363756773202994332, 'N', 'id', q'!!', 'DOM ID', 'AID5', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (72669278025796170900754497080839740301, q'!clickAt!', 72669278025794961974934882451665034125, 'N', 'xpath', q'!//a[contains(text(),'#LABEL#')]!', 'Target', 'AG10', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023698310034641976135214227203, q'!type!', 23877022567487157506002986031552406684, 'Y', 'id', q'!!', 'Name', 'AID6', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023699518960461590764388933379, q'!verifyTitle!', 23877022567489575357642215289901819036, 'N', '', q'!#OUTCOME PAGE TITLE#!', 'Target', 'AID7', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023700727886281205393563639555, q'!verifyElementPresent!', 23877022567494411060920673806600643740, 'N', 'id', q'!t_Alert_Success!', 'Target', 'AID8', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023703145737920434651913051907, q'!type!', 23879673651420019712993353029447073345, 'Y', 'id', q'!!', 'Name', 'AIEA', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023704354663740049281087758083, q'!click!', 23877022567502873541657976210823586972, 'N', 'xpath', q'!//table[@id='#NAME#_holder']/tbody/tr/td[2]/a!', 'Target', 'AIEB', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023705563589559663910262464259, q'!waitForPopUp!', 23877022567502873541657976210823586972, 'N', '', q'!!', '', 'AIEC', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023706772515379278539437170435, q'!pause!', 23877022567502873541657976210823586972, 'N', '', q'!3000!', '', 'AIED', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023707981441198893168611876611, q'!selectPopUp!', 23877022567502873541657976210823586972, 'N', '', q'!!', '', 'AIEE', 3, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023709190367018507797786582787, q'!click!', 23877022567502873541657976210823586972, 'N', 'xpath', q'!//a[contains(text(), '#DATA#')]!', 'Target', 'AIEF', 6, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023711608218657737056135995139, q'!click!', 23877022567512544948214893244221236380, 'N', '', q'!#NAME#_#DATA#!', 'Target', 'AIEH', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023712817144477351685310701315, q'!click!', 23877022567519798503132581019269473436, 'N', 'xpath', q'!(//td[contains(@headers, '#NAME#')]/span/a/img)[#ROW#]!', '', 'AIEI', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023714026070296966314485407491, q'!waitForPopUp!', 23877022567519798503132581019269473436, 'N', '', q'!winLov!', '', 'AIEJ', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023715234996116580943660113667, q'!selectWindow!', 23877022567519798503132581019269473436, 'N', '', q'!!', '', 'AIEK', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023716443921936195572834819843, q'!selectWindow!', 23877022567519798503132581019269473436, 'N', 'name', q'!winLov!', '', 'AIEL', 3, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023717652847755810202009526019, q'!click!', 23877022567519798503132581019269473436, 'Y', 'link', q'!!', 'Data', 'AIEM', 4, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023718861773575424831184232195, q'!assertElementNotPresent!', 23877022567519798503132581019269473436, 'N', 'name', q'!winLov!', '', 'AIEN', 5, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023720070699395039460358938371, q'!selectWindow!', 23877022567519798503132581019269473436, 'N', '', q'!!', '', 'AIEO', 6, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023721279625214654089533644547, q'!select!', 23877022567529469909689498052667122844, 'Y', 'xpath', q'!(//td[contains(@headers, '#NAME#')]/select|//td[contains(@headers, '#NAME#')]/b/select)[#ROW#]!', 'Target', 'AIEP', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023726115328493112606232469251, q'!type!', 23877022567539141316246415086064772252, 'Y', 'xpath', q'!(//td[contains(@headers, '#NAME#')]/b/input[1]|//td[contains(@headers, '#NAME#')]/input[1])[#ROW#]!', 'Target', 'AIET', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023727324254312727235407175427, q'!select!', 23877022567541559167885644344414184604, 'Y', 'id', q'!!', 'Name', 'AIEU', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023728533180132341864581881603, q'!click!', 23877022567543977019524873602763596956, 'N', 'link', q'!!', 'Label', 'AIEV', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023729742105951956493756587779, q'!type!', 23877022567546394871164102861113009308, 'Y', 'id', q'!!', 'Name', 'AIEW', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023730951031771571122931293955, q'!type!', 23877022567548812722803332119462421660, 'Y', 'id', q'!!', 'Name', 'AIEX', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023733368883410800381280706307, q'!click!', 23568505336838258347966380065345778416, 'N', 'id', q'!!', 'DOM ID', 'AIEZ', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023734577809230415010455412483, q'!click!', 23765045923433393552828924942589384341, 'N', 'id', q'!!', 'DOM ID', 'AIE0', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023735786735050029639630118659, q'!assertConfirmation!', 23765045923433393552828924942589384341, 'N', '', q'!#DELETE_CONFIRM_MSG#!', '', 'AIE1', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023736995660869644268804824835, q'!click!', 23806937381602042057724267858753550183, 'N', 'id', q'!#NAME#_#DATA#!', 'Target', 'AIE2', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023739413512508873527154237187, q'!open!', 23958696646134081405241812704752094938, 'N', '', q'!/pls/apex/f?p=#APP ID#:101:#PAGE ID#!', 'Target', 'AIE4', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023740622438328488156328943363, q'!waitForElementNotPresent!', 39024396043902260365281875927588938329, 'N', 'id', q'!superlov-fetch-results!', 'Target', 'AIE5', 9, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023743040289967717414678355715, q'!waitForVisible!', 24614709493656105474533386000533617397, 'N', '', q'!id=R113731551266759071!', '', 'AIE7', 2, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023744249215787332043853061891, q'!click!', 25425926765693112441055680575750336518, 'N', 'id', q'!!', 'DOM ID', 'AIE8', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023745458141606946673027768067, q'!assertConfirmation!', 25425926765693112441055680575750336518, 'N', '', q'!*!', '', 'AIE9', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023746667067426561302202474243, q'!click!', 25524938314995724863598986592767708485, 'N', 'xpath', q'!(//td[contains(@headers, '#NAME#')]/input[@type='checkbox'])[#ROW#]!', 'Target', 'AIFA', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023749084919065790560551886595, q'!click!', 35754179409484724920771295053231424376, 'N', 'xpath', q'!//img[@onclick="app_AppMenuMultiOpenBottom(this,'#DOM_ID#',false)"]!', '', 'AIFC', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023768427732179624627347185411, q'!waitForElementPresent!', 36312059334586861483101634148073227020, 'N', 'xpath', q'!//div[contains(@class,'ui-dialog')]!', '', 'AIFS', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023770845583818853885696597763, q'!pause!', 36312059334586861483101634148073227020, 'N', '', q'!2000!', '', 'AIFU', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023772054509638468514871303939, q'!pause!', 36312059334590488260560478035597345548, 'N', '', q'!2000!', '', 'AIFV', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023773263435458083144046010115, q'!click!', 36306567266338313428621755856336209150, 'N', 'xpath', q'!(//td[contains(@headers, '#NAME#')]/a)[#ROW#]!', 'Target', 'AIFW', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023776890212916927031570128643, q'!select!', 37146736791867621121281112843948689499, 'L', 'id', q'!!', 'Name', 'AIFZ', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023778099138736541660744834819, q'!click!', 24614709493656105474533386000533617397, 'N', 'xpath', q'!//*[contains(@class, '#DOM_ID#')]!', 'Target', 'AIF0', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023779308064556156289919540995, q'!setTimeout!', 24614709493656105474533386000533617397, 'N', '', q'!250000!', '', 'AIF1', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023780516990375770919094247171, q'!storeText!', 39850340506468507171491174461661554066, 'Y', 'xpath', q'!//span[contains(@id,'#NAME#')]!', '', 'AIF2', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023784143767834614806618365699, q'!pause!', 24614709493656105474533386000533617397, 'N', '', q'!3000!', '', 'AIF5', 3, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023788979471113073323317190403, q'!pause!', 23858542572669700969330700059483863540, 'N', '', q'!1000!', '', 'AIF9', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (57605729023790188396932687952491896579, q'!pause!', 39024396043902260365281875927588938329, 'N', '', q'!3000!', '', 'AIGA', 10, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (188090821211444064858435637325204302822, q'!echo!', 245412815083420034421939206446694980736, 'N', '', q'!Value store = ${#DATA#}!', '', 'AF4S', 1, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (172969237437108205287451038452660127544, q'!storeValue!', 245412815083420034421939206446694980736, 'Y', 'id', q'!#NAME#!', 'Target', 'AF4T', 0, 2, 42);
INSERT INTO ataf_selenium (selenium_id, selenium_command, action_id, data_yn, location, target, item_attribute, row_key, sort_order, row_version_number, theme_number) VALUES (198668999864156430131316113336043894720, q'!pause!', 23858542572669700969330700059483863540, 'N', '', q'!2000!', '', 'AF5N', 3, 3, 42);

INSERT INTO ataf_test_data (test_data_id, data_name, row_key) VALUES (309094072575201609256564956716457800122, 'LOVs', 'AFZI');
INSERT INTO ataf_test_data (test_data_id, data_name, row_key) VALUES (143077473429591767533937954441856082488, 'Numbers', 'AF3O');
INSERT INTO ataf_test_data (test_data_id, data_name, row_key) VALUES (130394790770466419283100855557019840968, 'Data Stores', 'AF4Y');
INSERT INTO ataf_test_data (test_data_id, data_name, row_key) VALUES (23958696646161886699092949175770336986, 'Text', 'AAA1');
INSERT INTO ataf_test_data (test_data_id, data_name, row_key) VALUES (5091148842521110660287129571702222454, 'Dates', 'AGMJ');
INSERT INTO ataf_test_data (test_data_id, data_name, row_key) VALUES (23750706356714787941350430989346714596, 'Address', 'AAAB'); 

INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (21693280996274456532093576256381946429, 'Date (DD-MON-YYYY) +/- days', '0', 0, 5091148842521110660287129571702222454, 'AGMK', 1);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (115205405076268287522421509048395130816, 'Date (DD-MON-YYYY) +/- months', '0', 1, 5091148842521110660287129571702222454, 'AGML', 1);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (2302723568663395677291944455297574990, 'Date (DD-MON-YYYY) +/- years', '0', 2, 5091148842521110660287129571702222454, 'AGMM', 1);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (23750706356717205792989660247696126948, 'Address Line 1', '52 Festive Road', 0, 23750706356714787941350430989346714596, 'AAAB', 12);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (23750706356718414718809274876870833124, 'Address Line 2', '', 1, 23750706356714787941350430989346714596, 'AAAC', 12);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (23750706356719623644628889506045539300, 'Town', 'London', 2, 23750706356714787941350430989346714596, 'AAAD', 12);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (23750706356720832570448504135220245476, 'County', 'Greater London', 3, 23750706356714787941350430989346714596, 'AAAE', 12);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (39094770565177092710738491630053014325, 'Post Code', 'SP10 4NJ', 4, 23750706356714787941350430989346714596, 'ACAG', 12);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (41019806491541944470255368948737385233, 'Email Address', 'djones.family@tiscali.co.uk', 5, 23750706356714787941350430989346714596, 'ACW3', 12);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (41084796184226948716895679790790492226, 'Alt Email Address', 'jonesd@cadetmail.mod.uk', 6, 23750706356714787941350430989346714596, 'AC28', 12);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (23958696646163095624912563804945043162, 'Large Text Area Large', 'We offer our bidding tool for free. Just register today and see how easy it is to win your favourite auction. With our automated sniping software and powerful servers, you do not have to turn on your computer and wait until the last moment.', 0, 23958696646161886699092949175770336986, 'AABG', null);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (23958696646164304550732178434119749338, 'Large Text Area Small', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.', 1, 23958696646161886699092949175770336986, 'AABH', null);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (30869507512914939340648167220703193227, 'Text string', 'quizzical jazziness tastingers', 2, 23958696646161886699092949175770336986, 'AAJS', null);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (42359066232159636718931697258343702339, 'Serial No (Alpha Numeric)', 'UUUNNNNNNN', 3, 23958696646161886699092949175770336986, 'ADEQ', 14);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (268777652101302883089876407629416125379, 'Data Store Save', 'STORE', 0, 130394790770466419283100855557019840968, 'AF4Z', null);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (122626296486759925052180999246484766597, 'Data Store Return', '${STORE}', 1, 130394790770466419283100855557019840968, 'AF40', null);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (103952921809845862149529604637287384418, 'Random Cost', '100', 0, 143077473429591767533937954441856082488, 'AF3P', 13);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (185483337421504829673435074560329252662, 'Random Integer', 'N', 1, 143077473429591767533937954441856082488, 'AF3Q', 14);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (299651498539605182229703232311378856073, 'Random Number', '10', 2, 143077473429591767533937954441856082488, 'AF3R', 13);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (19876063281146198217436789374280871864, 'Radio Group', '1', 0, 309094072575201609256564956716457800122, 'AFZJ', null);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (291818030219406114652941127277572028762, 'Select List', 'index=1', 1, 309094072575201609256564956716457800122, 'AF05', null);
INSERT INTO ataf_data_item (data_item_id, data_item_name, data_item_value, data_attribute, test_data_id, row_key, data_function) VALUES (22123635297703656750738103635882489674, 'Checkbox', '0', 2, 309094072575201609256564956716457800122, 'AGMI', null); 
