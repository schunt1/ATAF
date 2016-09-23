SET DEFINE OFF
SET VERIFY OFF
SET SERVEROUTPUT ON SIZE UNLIMITED
SET TIMING ON

spool install.log

PROMPT 'Running Tables'
-----------------------
@TABLES/TABLES

PROMPT 'Running Base Views'
---------------------------
@VIEWS/ATAF_APEX_PAGE_ITEMS_V
@VIEWS/ATAF_APEX_PAGE_ITEMS
@VIEWS/ATAF_RESULT_V
@VIEWS/ATAF_TEST_COND_FULL_V
@VIEWS/ATAF_FULL_TEST_DATA_V
@VIEWS/ATAF_TEST_CONDITION_FULL_V
@VIEWS/ATAF_TEST_CONDITION_V

PROMPT 'Running Packages'
-------------------------
@PACKAGES/ATAF_DATA_GENERATOR_PKS
@PACKAGES/ATAF_DATA_GENERATOR_PKB
@PACKAGES/ATAF_PKS
@PACKAGES/ATAF_PKB

PROMPT 'Running Materialized Views'
-----------------------------------
@MATERIALIZED_VIEWS/ATAF_APEX_PAGE_ITEMS_MV

PROMPT 'Create Trigger'
-----------------------
CREATE SEQUENCE   "ATAF_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1000000 CACHE 20 NOORDER  NOCYCLE
/

PROMPT 'Running Triggers'
-------------------------
@TRIGGERS/TRIGGERS

PROMPT 'Import Data'
--------------------
@ATAF_DATA/ATAF_ACTION_DATA
@ATAF_DATA/ATAF_SELENIUM_DATA
@ATAF_DATA/ATAF_TEST_DATA
@ATAF_DATA/ATAF_DATA_ITEM_DATA

SET DEFINE ON

PROMPT 'Change User to ATAF Workspace'
--------------------------------------
DECLARE
    l_workspace_id NUMBER;
    l_schema       VARCHAR(64);
BEGIN
    SELECT workspace_id INTO l_workspace_id
      FROM apex_workspaces
     WHERE workspace = '&&1';
     SELECT sys_context('USERENV','SESSION_USER')
	  INTO l_schema
    FROM dual;
	APEX_UTIL.SET_SECURITY_GROUP_ID(p_security_group_id=>l_workspace_id);
    APEX_APPLICATION_INSTALL.set_workspace_id( l_workspace_id );
    APEX_APPLICATION_INSTALL.set_application_id(&2);
    APEX_APPLICATION_INSTALL.generate_offset;
    APEX_APPLICATION_INSTALL.set_schema( l_schema );
    APEX_APPLICATION_INSTALL.set_application_alias( 'F' || apex_application.get_application_id );
END;
/

PROMPT 'Insatlling ATAF Apex Application'
-----------------------------------------
PROMPT 'Installing Application'
@APPLICATION_EXPORTS/ATAF_APPLICATION

PROMPT 'Running Web Services'
-----------------------------
@WEB_SERVICES/SELENIUM_WEB_SERVICES

PROMPT 'Create Test Users'
--------------------------
@SQL/CREATE_USERS &1