CREATE OR REPLACE FORCE VIEW "ATAF_TEST_CONDITION_V" ("DATA_ITEM_ID", "DATA_ID", "TEST_COND_ID", "ROW_NUMBER", "CON_SORT_ORDER", "PAGE_ID", "OUTCOME_PAGE_ID", "ACTION_ID", "OUTCOME_ID", "DATA_ATTRIBUTE", "TEST_DATA_ID", "TEST_CASE_ID", "TEST_CASE", "NOTES", "ID", "DOM_ID", "NAME", "LABEL", "ELEMENT_TYPE", "REGION_ID", "REGION_NAME", "SCRIPT", "ACTION", "OUTCOME_SCRIPT", "ACTION_OUTCOME", "DATA_ITEM_VALUE", "DATA_ITEM_NAME", "PAGE_TITLE", "OUTCOME_PAGE_TITLE", "THEME_NUMBER", "APPLICATION_ID", "PROJECT_ID", "DATA_GROUP_ID", "ROW_KEY", "ERROR", "NOT_IN_GROUP") AS 
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
--| Description : Denormalised test condition outcomes on one line              |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-16 1       Initial Version                           |
--| S. Hunt         13-May-17 2       Not In Group.                             |
--+=============================================================================+ 
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
  else null end error,
  con.not_in_group
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
