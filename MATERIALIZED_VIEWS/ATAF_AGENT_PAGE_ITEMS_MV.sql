CREATE MATERIALIZED VIEW ATAF_AGENT_PAGE_ITEMS_MV
  AS 
select * from ATAF_APEX_PAGE_ITEMS_V
-------------------------------------------------------------------------------------------- 
-- If installing as an Agent MV then prefix the object with the schema name for ATAF e.g. --
-- select * from ATAF.ATAF_APEX_PAGE_ITEMS_V                                              --
--------------------------------------------------------------------------------------------
/