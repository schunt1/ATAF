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