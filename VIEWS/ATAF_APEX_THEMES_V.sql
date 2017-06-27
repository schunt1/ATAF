CREATE OR REPLACE FORCE VIEW "ATAF_APEX_THEMES_V" ("WORKSPACE", "WORKSPACE_DISPLAY_NAME", "APPLICATION_ID", "APPLICATION_NAME", "THEME_NUMBER", "THEME_NAME", "THEME_INTERNAL_NAME", "UI_TYPE_ID", "UI_TYPE_NAME", "REFERENCE_ID", "NAVIGATION_TYPE", "NAVIGATION_TYPE_CODE", "DEFAULT_NAV_LIST_POSITION", "NAV_BAR_TYPE", "NAV_BAR_TYPE_CODE", "IS_LOCKED", "IS_CURRENT", "DEFAULT_PAGE_TEMPLATE", "DEFAULT_BUTTON_TEMPLATE", "DEFAULT_REGION_TEMPLATE", "DEFAULT_CHART_RG_TEMPLATE", "DEFAULT_FORM_RG_TEMPLATE", "DEFAULT_REPORT_REGION_TEMPLATE", "DEFAULT_TABULAR_FORM_TEMPLATE", "DEFAULT_WIZARD_TEMPLATE", "DEFAULT_BREADCRUMB_RG_TEMPLATE", "DEFAULT_LIST_REGION_TEMPLATE", "DEFAULT_IRR_TEMPLATE", "DEFAULT_HEADER_TEMPLATE", "DEFAULT_FOOTER_TEMPLATE", "DEFAULT_REPORT_ROW_TEMPLATE", "DEFAULT_ITEM_LABEL_TEMPLATE", "DEFAULT_BREADCRUMB_TEMPLATE", "DEFAULT_CALENDAR_TEMPLATE", "DEFAULT_LIST_TEMPLATE", "DEFAULT_NAV_LIST_TEMPLATE", "DEFAULT_TOP_NAV_LIST_TEMPLATE", "DEFAULT_SIDE_NAV_LIST_TEMPLATE", "DEFAULT_OPTION_LABEL", "DEFAULT_REQUIRED_LABEL", "DEFAULT_NAV_BAR_LIST_TEMPLATE", "DEFAULT_DIALOG_TEMPLATE", "DEFAULT_DIALOGR_TEMPLATE", "DEFAULT_DIALOGBTNR_TEMPLATE", "DEFAULT_PAGE_TRANSITION", "DEFAULT_POPUP_TRANSITION", "LAST_UPDATED_ON", "LAST_UPDATED_BY", "CALENDAR_ICON_IMAGE_NAME", "CALENDAR_ICON_ATTRIBUTES", "CUSTOM_ICON_CLASSES", "CUSTOM_ICON_PREFIX_CLASS", "CUSTOM_LIBRARY_FILE_URLS", "ICON_LIBRARY", "JAVASCRIPT_FILE_URLS", "CSS_FILE_URLS", "THEME_ID", "THEME_DESCRIPTION", "FILE_PREFIX", "FILES_VERSION", "COMPONENT_SIGNATURE") AS 
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
 "WORKSPACE","WORKSPACE_DISPLAY_NAME","APPLICATION_ID","APPLICATION_NAME","THEME_NUMBER","THEME_NAME","THEME_INTERNAL_NAME","UI_TYPE_ID","UI_TYPE_NAME","REFERENCE_ID","NAVIGATION_TYPE","NAVIGATION_TYPE_CODE","DEFAULT_NAV_LIST_POSITION","NAV_BAR_TYPE","NAV_BAR_TYPE_CODE","IS_LOCKED","IS_CURRENT","DEFAULT_PAGE_TEMPLATE","DEFAULT_BUTTON_TEMPLATE","DEFAULT_REGION_TEMPLATE","DEFAULT_CHART_RG_TEMPLATE","DEFAULT_FORM_RG_TEMPLATE","DEFAULT_REPORT_REGION_TEMPLATE","DEFAULT_TABULAR_FORM_TEMPLATE","DEFAULT_WIZARD_TEMPLATE","DEFAULT_BREADCRUMB_RG_TEMPLATE","DEFAULT_LIST_REGION_TEMPLATE","DEFAULT_IRR_TEMPLATE","DEFAULT_HEADER_TEMPLATE","DEFAULT_FOOTER_TEMPLATE","DEFAULT_REPORT_ROW_TEMPLATE","DEFAULT_ITEM_LABEL_TEMPLATE","DEFAULT_BREADCRUMB_TEMPLATE","DEFAULT_CALENDAR_TEMPLATE","DEFAULT_LIST_TEMPLATE","DEFAULT_NAV_LIST_TEMPLATE","DEFAULT_TOP_NAV_LIST_TEMPLATE","DEFAULT_SIDE_NAV_LIST_TEMPLATE","DEFAULT_OPTION_LABEL","DEFAULT_REQUIRED_LABEL","DEFAULT_NAV_BAR_LIST_TEMPLATE","DEFAULT_DIALOG_TEMPLATE","DEFAULT_DIALOGR_TEMPLATE","DEFAULT_DIALOGBTNR_TEMPLATE","DEFAULT_PAGE_TRANSITION","DEFAULT_POPUP_TRANSITION","LAST_UPDATED_ON","LAST_UPDATED_BY","CALENDAR_ICON_IMAGE_NAME","CALENDAR_ICON_ATTRIBUTES","CUSTOM_ICON_CLASSES","CUSTOM_ICON_PREFIX_CLASS","CUSTOM_LIBRARY_FILE_URLS","ICON_LIBRARY","JAVASCRIPT_FILE_URLS","CSS_FILE_URLS","THEME_ID","THEME_DESCRIPTION","FILE_PREFIX","FILES_VERSION","COMPONENT_SIGNATURE" FROM ATAF_AGENT_THEMES_MV
-------------------------------------------------------------------------------
-- The Apex View are only able to access application elements from the       --
-- applications parsing schema.  Therefore, you will need to add Agent MVs   --
-- to the parsing schemas of all the applications you want to test.  Then    --
-- grant select on the agent view to the ATAF schema and union them below eg --
-------------------------------------------------------------------------------
/*
UNION ALL
SELECT * FROM OTHER.ATAF_APEX_THEMES_V
*/
/
