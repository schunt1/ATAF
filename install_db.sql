SET DEFINE OFF
SET VERIFY OFF
SET SERVEROUTPUT ON SIZE UNLIMITED
SET TIMING ON

spool install.log

PROMPT 'Running Tables and Sequence'
------------------------------------
@TABLES/TABLES

PROMPT 'Running Base Views'
---------------------------
@VIEWS/ATAF_APEX_PAGES_V
@VIEWS/ATAF_APEX_SHORTCUTS_V
@VIEWS/ATAF_APEX_THEMES_V
@VIEWS/ATAF_APEX_PAGE_ITEMS_V
@VIEWS/ATAF_APEX_PAGE_ITEMS
@VIEWS/ATAF_TEST_COND_FULL_V
@VIEWS/ATAF_FULL_TEST_DATA_V
@VIEWS/ATAF_FULL_TEST_DATA_CV
@VIEWS/ATAF_TEST_CONDITION_FULL_V
@VIEWS/ATAF_TEST_CONDITION_V
@VIEWS/ATAF_APEX_APPLICATION_PAGES_V

PROMPT 'Running Packages'
-------------------------
@PACKAGES/ATAF_DATA_GENERATOR_PKS
@PACKAGES/ATAF_DATA_GENERATOR_PKB
@PACKAGES/ATAF_PKS
@PACKAGES/ATAF_PKB
@PACKAGES/ATAF_TEST_LAB_PKS
@PACKAGES/ATAF_TEST_LAB_PKB

PROMPT 'Running Materialized Views'
-----------------------------------
@MATERIALIZED_VIEWS/ATAF_AGENT_PAGE_ITEMS_MV
@MATERIALIZED_VIEWS/ATAF_AGENT_PAGES_MV
@MATERIALIZED_VIEWS/ATAF_AGENT_SHORTCUTS_MV
@MATERIALIZED_VIEWS/ATAF_AGENT_THEMES_MV

PROMPT 'Running Triggers'
-------------------------
@TRIGGERS/TRIGGERS

PROMPT 'Running Functions'
--------------------------
@FUNCTIONS/ATAF_MIGRATE_SCRIPT

PROMPT 'Import Data'
--------------------
@ATAF_DATA/ATAF_PROJECT_DATA_TABLE.sql
@ATAF_DATA/ATAF_ACTION_DATA_TABLE.sql
@ATAF_DATA/ATAF_SELENIUM_DATA_TABLE.sql
@ATAF_DATA/ATAF_TEST_DATA_DATA_TABLE.sql
@ATAF_DATA/ATAF_DATA_ITEM_DATA_TABLE.sql
@ATAF_DATA/ATAF_DATA_DATA_TABLE.sql
@ATAF_DATA/ATAF_MODULE_DATA_TABLE.sql
@ATAF_DATA/ATAF_TEST_SPEC_DATA_TABLE.sql
@ATAF_DATA/ATAF_TEST_CASE_DATA_TABLE.sql
@ATAF_DATA/ATAF_TEST_COND_DATA_TABLE.sql
@ATAF_DATA/ATAF_SPEC_CASE_DATA_TABLE.sql
@ATAF_DATA/ATAF_TEMP_MV_DATA_TABLE.sql

PROMPT 'System Parameters'
--------------------------
BEGIN
  INSERT INTO ataf_system_parameters
  (name,
   value,
   start_date)
  VALUES
  ('Wallet Path',
   '',
   sysdate);
  INSERT INTO ataf_system_parameters
  (name,
   value,
   start_date)
  VALUES
  ('Wallet Password',
   '',
   sysdate);
  INSERT INTO ataf_system_parameters
  (name,
   value,
   start_date)
  VALUES
  ('ATAF Version',
   '0.2.0 Beta',
   sysdate);
END;
/

PROMPT 'Migrate Data'
---------------------
BEGIN
  UPDATE ataf_test_cond set apex_item_id = ataf_migrate_script(apex_item_id) where apex_item_id is not null;
END;
/