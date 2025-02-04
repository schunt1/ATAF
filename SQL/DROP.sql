SET DEFINE OFF
SET VERIFY OFF
SET SERVEROUTPUT ON SIZE UNLIMITED
SET TIMING ON

spool drop.log

drop TABLE "ATAF_ACTION" cascade constraints 
/   
drop TABLE ATAF_DATA cascade constraints 
/
drop TABLE ATAF_DATA_GROUPS cascade constraints 
/
drop TABLE ATAF_DATA_ITEM cascade constraints 
/
drop TABLE ATAF_ITEM cascade constraints 
/
drop TABLE ATAF_MODULE cascade constraints 
/
drop TABLE ATAF_PROJECT cascade constraints 
/
drop TABLE ATAF_SELENIUM cascade constraints 
/
drop TABLE ATAF_SPEC_CASE cascade constraints 
/
drop TABLE ATAF_SYSTEM_PARAMETERS cascade constraints 
/
drop TABLE ATAF_TEST_CASE cascade constraints 
/
drop TABLE ATAF_TEST_CASE_IOT cascade constraints 
/
drop TABLE ATAF_TEST_COND cascade constraints 
/
drop TABLE ATAF_TEST_DATA cascade constraints 
/
drop TABLE ATAF_TEST_SPEC cascade constraints 
/
drop TABLE ATAF_USER_RESTRICTIONS cascade constraints 
/
drop TABLE ATAF_TL_TEST cascade constraints
/
drop TABLE ATAF_TL_JOB cascade constraints
/
drop TABLE ATAF_TEMP_MV cascade constraints
/
drop VIEW ATAF_APEX_APPLICATION_PAGES_V cascade constraints 
/
drop VIEW ATAF_APEX_PAGE_ITEMS cascade constraints 
/
drop VIEW ATAF_APEX_PAGE_ITEMS_V cascade constraints 
/
drop VIEW ATAF_FULL_TEST_DATA_V cascade constraints 
/
drop VIEW ATAF_TEST_CONDITION_FULL_V cascade constraints 
/
drop VIEW ATAF_TEST_CONDITION_V cascade constraints 
/
drop VIEW ATAF_TEST_COND_FULL_V cascade constraints 
/ 
drop VIEW ATAF_APEX_PAGES_V cascade constraints 
/ 
drop VIEW ATAF_APEX_SHORTCUTS_V cascade constraints 
/
drop VIEW ATAF_APEX_THEMES_V cascade constraints 
/

drop SEQUENCE ATAF_SEQ 
/
drop PACKAGE ATAF_DATA_GENERATOR 
/
drop PACKAGE ATAF_PKG 
/
drop PACKAGE ATAF_TEST_LAB
/
DROP MATERIALIZED VIEW ATAF_AGENT_SHORTCUTS_MV
/
DROP MATERIALIZED VIEW ATAF_AGENT_PAGES_MV
/
DROP MATERIALIZED VIEW ATAF_AGENT_THEMES_MV
/
DROP MATERIALIZED VIEW ATAF_AGENT_PAGE_ITEMS_MV
/

SET DEFINE ON

@SQL/DROP_USERS &1
/