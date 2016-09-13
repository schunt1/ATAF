CREATE OR REPLACE FORCE VIEW "ATAF_APEX_PAGE_ITEMS_V" ("APPLICATION_ID", "PAGE_ID", "LABEL", "TYPE", "DOM_ID", "NAME", "DISPLAY_SEQUENCE", "DISPLAY_SEQUENCE1", "DISPLAY_SEQUENCE2", "ID", "ELEMENT_TYPE", "PAGE_ALIAS", "REGION_ID", "REGION_NAME", "REGION_POSITION", "DISPLAY") AS 
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
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--| S. Hunt         26-Jun-16 2       New display column added                  |
--|                                   ATAF_WORSPACE WHERE Clause added          |
--| S.Hunt          02-Jul-16 3       Changed Nav Bar to list item              |
--| S.Hunt          06-Jul-16 4       Interactive report use Region Name        |
--| S.Hunt          17-Jul-16 5       IR Static Region ID Added to DOM_ID       |
--| S.Hunt          30-Jul-16 6       ataf_workspace removed                    |
--| S.Hunt          31-Jul-16 7       Reports type added                        |
--| S.Hunt          03-Sep-16 8       Custom Items Removed                      |
--| S.Hunt          13-Sep-16 9       Carriage Returns removed                  |
--+=============================================================================+   
   ----------------
   -- List Items --
   ----------------
          ent.application_id,
          reg.page_id,
          case
            when reg.region_name = 'Header Quick Navigation' then ent.entry_text
            when ent.list_entry_parent_id is not null then '- '||ent.entry_text
            else ent.entry_text end label,
          decode(reg.region_name,'Header Quick Navigation','Nav Bar','List Item') TYPE,
          'L' || ent.list_entry_id dom_id,
          ent.entry_text name,
          ent.display_sequence,
          nvl(ent.list_entry_parent_id,ent.list_entry_id) display_sequence1,
          nvl2(ent.list_entry_parent_id,ent2.display_sequence,ent.display_sequence) display_sequence2,
          ent.list_entry_id id,
          'a' element_type,
          NULL page_alias,
          to_char(reg.region_id),
          reg.region_name,
          reg.display_position,
          decode (ent.condition_type, 'Never','N','Y') display
     FROM apex_application_list_entries ent
          join apex_application_lists lis ON ent.list_id = lis.list_id and ent.workspace = lis.workspace
          join apex_application_page_regions reg ON lis.list_id = reg.list_id and lis.workspace = reg.workspace
          left outer join apex_application_list_entries ent2 on ent.list_entry_parent_id = ent2.list_entry_id and ent.workspace = ent2.workspace
    --WHERE ent.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)    
   UNION ALL
   ------------------------
   -- Application Region --
   ------------------------     
   SELECT
     reg.application_id "APPLICATION_ID", 
     reg.page_id "PAGE_ID", 
     reg.region_name "LABEL", 
     reg.source_type "TYPE", 
     'R'||reg.region_id "DOM_ID", 
     reg.region_name "NAME", 
     reg.display_sequence "DISPLAY_SEQUENCE", 
     null "DISPLAY_SEQUENCE1", 
     null "DISPLAY_SEQUENCE2", 
     to_number(reg.region_id) "ID", 
     'div' "ELEMENT_TYPE", 
     aap.page_alias "PAGE_ALIAS", 
     to_char(reg.region_id) "REGION_ID", 
     reg.region_name "REGION_NAME", 
     reg.display_position "REGION_POSITION", 
     decode(reg.condition_type, 'Never', 'N', 'Y') "DISPLAY"
   FROM apex_application_page_regions reg
   LEFT JOIN apex_application_pages aap ON reg.page_id = aap.page_id
   WHERE reg.source_type = 'Report'
   UNION ALL   
   ------------------------
   -- Sidebar Navigation --
   ------------------------
   SELECT 
          ent.application_id,
          0 page_id,
          SUBSTR(ent.entry_text,1,INSTR(ent.entry_text,'&')-2) label,
          'List Item' TYPE,
          'L' || ent.list_entry_id dom_id,
          ent.entry_text name,
          ent.display_sequence,
          null display_sequence1,
          null display_sequence2,
          ent.list_entry_id id,
          'a' element_type,
          null,
          null,
          'Sidebar Navigation',
          null,
          'Y' display
     FROM apex_application_list_entries ent
     JOIN APEX_APPL_USER_INTERFACES ui ON ent.application_id = ui.application_id
                                      AND ent.list_id = ui.navigation_list_id
                                      and ent.workspace = ui.workspace
     --where ent.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)                                
     UNION ALL
   -----------------------------------
   -- Parent List Items Stores Only --
   -----------------------------------
     SELECT reg.application_id,
          reg.page_id,
          reg.region_name label,
          'Parent List Item' TYPE,
          to_char(lis.list_name) dom_id,
          lis.list_name name,
          reg.display_sequence,
          null display_sequence1,
          null display_sequence2,
          lis.list_id id,
          'a' element_type,
          NULL page_alias,
          to_char(reg.region_id) region_id,
          reg.region_name,
          reg.display_position,
          'Y' display
     FROM apex_application_lists lis,
          apex_application_page_regions reg
    WHERE reg.list_id = lis.list_id
      and reg.workspace = lis.workspace
      --and reg.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   ------------------
   -- Custom Items --
   ------------------
/*   SELECT application_id,
          page_id,
          item_label label,
          item_type TYPE,
          item_dom_id,
          item_name name,
          display_sequence,
          null display_sequence1,
          null display_sequence2,
          item_id id,
          NULL element_type,
          NULL page_alias,
          NULL region_id,
          null region_name,
          null region_position,
          'Y' display
   FROM ataf_item
   UNION ALL*/
   -------------
   -- Nav Bar --
   -------------
   SELECT 
          ent.application_id,
          0 page_id,
          ent.entry_text label,
          'Nav Bar' TYPE,
          'L' || ent.list_entry_id dom_id,
          ent.entry_text name,
          ent.display_sequence,
          null display_sequence1,
          null display_sequence2,
          ent.list_entry_id id,
          NULL,
          NULL page_alias,
          NULL region_id,
          'Nav Bar' region_name,
          'Nav Bar' region_position,
          'Y' display
     FROM apex_application_list_entries ent
     JOIN APEX_APPL_USER_INTERFACES ui ON ent.application_id = ui.application_id
                                      AND ent.list_id = ui.nav_bar_list_id
                                      and ent.workspace = ui.workspace
    where ent.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   -----------------
   -- Apex Items  --
   -----------------
   SELECT aapi.application_id,
          aapi.page_id,
          NVL (aapi.label, aapi.item_name),
          decode(aapi.display_as,'Text Field with autocomplete','Text Field',aapi.display_as) display_as,
          TO_CHAR (aapi.item_id) r,
          aapi.item_name,
          aapi.display_sequence,
          null display_sequence1,
          null display_sequence2,
          aapi.item_id,
          NULL,
          NULL page_alias,
          NULL region_id,
          aapi.region region_name,
          null region_position,
          case when aapi.display_as = 'Hidden' then 'N'
               when aapi.condition_type = 'Never' then 'N'
               else 'Y' end disply
     FROM apex_application_page_items aapi
   -- WHERE aapi.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   -------------------
   -- Apex Buttons  --
   -------------------
   SELECT application_id,
          page_id,
          NVL (label, button_name),
          'Button',
          CASE
          WHEN button_static_id is not null THEN button_static_id
          WHEN button_position = 'Among region items' THEN button_name
          ELSE 'B' || button_id END,
          button_name,
          button_sequence,
          null display_sequence1,
          null display_sequence2,
          button_id,
          NULL,
          NULL page_alias,
          NULL region_id,
          region region_name,
          null region_position,
          decode(condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_page_buttons
--    WHERE workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   ---------------
   -- Apex Tabs --
   ---------------
   SELECT a.application_id,
          0 page_id,
          tab_label,
          'Tab',
          TO_CHAR (a.tab_id),
          a.tab_name,
          a.display_sequence,
          null display_sequence1,
          null display_sequence2,
          a.tab_id,
          NULL,
          NULL page_alias,
          NULL region_id,
          'Tab Region' region_name,
          null region_position,
          decode(condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_tabs a
--    WHERE a.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   -----------------
   -- IR Columns  --
   -----------------
   SELECT application_id,
          page_id,
          report_label,
          'Report Column',
          TO_CHAR (column_id),
          column_alias,
          display_order,
          null display_sequence1,
          null display_sequence2,
          column_id,
          NULL,
          NULL page_alias,
          to_char(interactive_report_id) region_id,
          'Interactive Report' region_name,
          null region_position,
          decode(display_condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_page_ir_col
--    WHERE workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   --------------------
   -- Report Columns --
   --------------------
   SELECT application_id,
          page_id,
          NVL (heading, column_alias) label,
          'Report Column' TYPE,
          TO_CHAR (region_report_column_id) id,
          column_alias name,
          display_sequence,
          null display_sequence1,
          null display_sequence2,
          region_report_column_id,
          NULL,
          NULL page_alias,
          'datatable_R' || region_id region_id,
          region_name,
          null region_position,
          decode(condition_type, 'Never', 'N', 'Y') display
     FROM apex_application_page_rpt_cols
    WHERE column_is_hidden = 'No'
--      and workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   -------------------
   -- IR Components --
   -------------------
   SELECT aa.application_id,
          aa.page_id,
          ir.label,
          ir.TYPE,
          nvl(aa.static_id,'R'||to_char(aa.region_id)) dom_id,
          ir.dom_id name,
          ir.display_sequence,
          null display_sequence1,
          null display_sequence2,
          TO_NUMBER (aa.interactive_report_id || ir.id) id,
          NULL,
          NULL page_alias,
          to_char(aa.region_id) region_id,
          lower(aa.region_name) region_name,
          null region_position,
          'Y' display
     FROM (SELECT 'IR Search' label,
                  'IR Search' TYPE,
                  'apexir_SEARCH' dom_id,
                  10 display_sequence,
                  1 id,
                  NULL
             FROM DUAL
           UNION ALL
           --select
           --  'IR Go Button' label,
           --  'IR Go Button' type,
           --  'apexir_btn_SEARCH' dom_id,
           --  20 display_sequence,
           --  2 id    --from dual
           --union all
           SELECT 'IR Reset' label,
                  'IR Reset' TYPE,
                  'apexir_ACTIONSMENUROOT' dom_id,
                  30 display_sequence,
                  3 id,
                  NULL
             FROM DUAL
           UNION ALL
                    SELECT 'IR Saved Report' label,
                  'IR Saved Report' TYPE,
                  'apexir_SAVED_REPORTS' dom_id,
                  25 display_sequence,
                  5 id,
                  NULL
             FROM DUAL
           UNION ALL
           SELECT '** Link Column **' label,
                  'Report Column' TYPE,
                  'LINK' dom_id,
                  0 display_sequence,
                  4 id,
                  NULL
             FROM DUAL) ir,
          --apex_application_page_ir aa
          (select 
             ir.workspace,
             ir.application_id, 
             ir.page_id,
             ir.interactive_report_id,
             ir.region_name,
             ir.region_id,
             pr.static_id
           from 
             apex_application_page_ir ir 
           join APEX_APPLICATION_PAGE_REGIONS pr on ir.region_id = pr.region_id) aa
--          where aa.workspace = (SELECT v('ATAF_WORKSPACE') FROM DUAL)
   UNION ALL
   --------------
   -- Outcomes --
   --------------
   SELECT NULL application_id,
          0 page_id,
          'Outcome' label,
          'Outcome' TYPE,
          NULL dom_id,
          NULL name,
          NULL display_sequence,
          null display_sequence1,
          null display_sequence2,
          NULL id,
          NULL element_type,
          NULL page_alias,
          NULL region_id,
          null region_name,
          null region_position,
          'Y' display
     FROM DUAL
   UNION ALL
   -----------------
   -- Global Item --
   -----------------
   SELECT NULL application_id,
          0 page_id,
          'Global Item' label,
          'Custom' TYPE,
          NULL dom_id,
          'Global Custom' name,
          NULL display_sequence,
          null display_sequence1,
          null display_sequence2,
          0 id,
          NULL element_type,
          NULL page_alias,
          NULL region_id,
          null region_name,
          null region_position,
          'Y' dislpay
     FROM DUAL
/