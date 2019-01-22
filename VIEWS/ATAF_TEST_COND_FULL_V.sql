CREATE OR REPLACE FORCE VIEW "ATAF_TEST_COND_FULL_V" ("APPLICATION_ID", "DATA_ID", "TEST_COND_ID", "TEST_CASE_ID", "DATA_ITEM_ID", "ACTION_ID", "OUTCOME_PAGE_ID", "APEX_ITEM_ID", "SORT_ORDER", "PAGE_ID", "ROW_NUMBER", "LAST_UPDATED_DATE", "LAST_UPDATED_BY", "ROW_KEY", "ROW_VERSION_NUMBER", "DATA_ATTRIBUTE", "DATA_GROUP_ID", "TYPE", "OUTCOME_ID", "NOT_IN_GROUP") AS 
  select
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
--| Description : Seperates Outcomes into a seperate row                        |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-16 1       Initial Version                           |
--| S. Hunt         13-May-17 2       Not In Group.                             |
--| S. Hunt         18-Jan-19 3       Application ID in test condition          |
--+=============================================================================+ 
 APPLICATION_ID,
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
 OUTCOME_ID,
 NOT_IN_GROUP
 from ATAF_TEST_COND
UNION ALL
select
 APPLICATION_ID,
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
  null,
  NOT_IN_GROUP
 from ATAF_TEST_COND
WHERE outcome_id IS NOT NULL
/
