CREATE OR REPLACE FORCE VIEW "ATAF_APEX_PAGE_ITEMS" ("APPLICATION_ID", "PAGE_ID", "LABEL", "TYPE", "DOM_ID", "NAME", "DISPLAY_SEQUENCE", "ID", "ELEMENT_TYPE", "REGION_ID", "REGION_NAME", "DISPLAY_SEQUENCE1", "DISPLAY_SEQUENCE2") AS 
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
--| S. Hunt         09-Aug-16 1       Initial Version                           |
--| S. Hunt         02-Sep-16 2       Ataf Items added                          |
--| S. Hunt         10-Mar-17 3       Region Name added to Items                |
--| S. Hunt         09-Apr-17 4       Updated to use Agent.                     |
--+=============================================================================+   
 APPLICATION_ID,
 PAGE_ID,
 LABEL,
 TYPE,
 DOM_ID,
 NAME,
 DISPLAY_SEQUENCE,
 ID,
 ELEMENT_TYPE,
 REGION_ID,
 REGION_NAME,
 DISPLAY_SEQUENCE1,
 DISPLAY_SEQUENCE2
FROM
  ATAF_AGENT_PAGE_ITEMS_MV
UNION ALL
SELECT 
  application_id,
  page_id,
  item_label label,
  item_type TYPE,
  item_dom_id,
  item_name name,
  display_sequence,
  item_id id,
  NULL element_type,
  NULL region_id,
  region_name,
  null display_sequence1,
  null display_sequence2
FROM ataf_item
-------------------------------------------------------------------------------
-- The Apex View are only able to access application elements from the       --
-- applications parsing schema.  Therefore, you will need to add Agent MVs   --
-- to the parsing schemas of all the applications you want to test.  Then    --
-- grant select on the agent view to the ATAF schema and union them below eg --
-------------------------------------------------------------------------------
/*
UNION ALL
SELECT
 APPLICATION_ID,
 PAGE_ID,
 LABEL,
 TYPE,
 DOM_ID,
 NAME,
 DISPLAY_SEQUENCE,
 ID,
 ELEMENT_TYPE,
 REGION_ID,
 REGION_NAME,
 DISPLAY_SEQUENCE1,
 DISPLAY_SEQUENCE2
FROM
  OTHER.ATAF_AGENT_PAGE_ITEMS_MV
*/
/