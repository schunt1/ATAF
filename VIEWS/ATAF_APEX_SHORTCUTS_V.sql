CREATE OR REPLACE FORCE VIEW "ATAF_APEX_SHORTCUTS_V" 
AS
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
* FROM ATAF_AGENT_SHORTCUTS_MV
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