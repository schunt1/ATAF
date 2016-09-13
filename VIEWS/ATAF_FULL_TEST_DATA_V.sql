CREATE OR REPLACE FORCE VIEW "ATAF_FULL_TEST_DATA_V" ("DATA_ID", "DATA_ITEM_ID", "ROW_NAME", "ROW_NUMBER", "ROW_KEY", "DATA_ITEM_VALUE", "TEST_DATA_ID", "LAST_UPDATED_DATE", "LAST_UPDATED_BY", "ATTRIBUTE", "DATA_ITEM_NAME", "DATA_GROUP_ID") AS 
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
--| Description : View of default data and bulk data                            |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-16 1       Initial Version                           |
--| S. Hunt         19-Jul-16 2       Include NULLS in UNPIVOT                  |
--+=============================================================================+   
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
    -- this needs looking at, it dont handle nulls
    when 14 then ataf_data_generator.string_generator(nvl(x.data_item_value,' '),NVL(di.parameter1,'/'))
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
UNPIVOT INCLUDE NULLS (data_item_value FOR attribute IN (
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