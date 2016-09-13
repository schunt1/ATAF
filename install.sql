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
@MATERIALIZED_VIEWS/ATAF_APEX_PAGE_ITEMS_MV
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

PROMPT 'Running Triggers'
-------------------------
@TRIGGERS/TRIGGERS

PROMPT 'Import Data'
--------------------
@ATAF_DATA/ATAF_ACTION_DATA
@ATAF_DATA/ATAF_SELENIUM_DATA
@ATAF_DATA/ATAF_TEST_DATA
@ATAF_DATA/ATAF_DATA_ITEM_DATA

PROMPT 'Change User to ATAF Workspace'
--------------------------------------
DECLARE
    l_workspace_id NUMBER;
BEGIN
    SELECT workspace_id INTO l_workspace_id
      FROM apex_workspaces
     WHERE workspace = 'ATAF';
    apex_application_install.set_workspace_id( l_workspace_id );
    apex_application_install.set_application_id(108);
    apex_application_install.generate_offset;
    apex_application_install.set_schema( 'ATAF' );
    apex_application_install.set_application_alias( 'F' || apex_application.get_application_id );
    PROMPT 'Create Application Group'
    ---------------------------------
    APEX_UTIL.SET_SECURITY_GROUP_ID(p_security_group_id=>l_workspace_id);
    APEX_UTIL.CREATE_USER_GROUP(p_group_name => 'ataf_administrator');
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
@SQL/CREATE_USERS