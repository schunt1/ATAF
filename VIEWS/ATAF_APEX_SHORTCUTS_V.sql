CREATE OR REPLACE FORCE VIEW "ATAF_APEX_SHORTCUTS_V" ("WORKSPACE", "WORKSPACE_DISPLAY_NAME", "APPLICATION_ID", "APPLICATION_NAME", "SHORTCUT_NAME", "SHORTCUT_TYPE", "CONDITION_TYPE", "CONDITION_TYPE_CODE", "CONDITION_EXPRESSION1", "CONDITION_EXPRESSION2", "ERROR_TEXT", "BUILD_OPTION", "SHORTCUT", "IS_SUBSCRIBED", "SUBSCRIBED_FROM", "LAST_UPDATED_BY", "LAST_UPDATED_ON", "COMPONENT_COMMENTS", "SHORTCUT_ID", "COMPONENT_SIGNATURE") AS 
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
--| Description : View that unions all the agent views into one object.         |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         09-Apr-17 1       Initial Version                           |
--+=============================================================================+ 
"WORKSPACE","WORKSPACE_DISPLAY_NAME","APPLICATION_ID","APPLICATION_NAME","SHORTCUT_NAME","SHORTCUT_TYPE","CONDITION_TYPE","CONDITION_TYPE_CODE","CONDITION_EXPRESSION1","CONDITION_EXPRESSION2","ERROR_TEXT","BUILD_OPTION","SHORTCUT","IS_SUBSCRIBED","SUBSCRIBED_FROM","LAST_UPDATED_BY","LAST_UPDATED_ON","COMPONENT_COMMENTS","SHORTCUT_ID","COMPONENT_SIGNATURE" FROM ATAF_AGENT_SHORTCUTS_MV
-------------------------------------------------------------------------------
-- The Apex View are only able to access application elements from the       --
-- applications parsing schema.  Therefore, you will need to add Agent MVs   --
-- to the parsing schemas of all the applications you want to test.  Then    --
-- grant select on the agent view to the ATAF schema and union them below eg --
-------------------------------------------------------------------------------
/*
UNION ALL
SELECT * FROM OTHER.ATAF_AGENT_SHORTCUTS_MV
*/
/