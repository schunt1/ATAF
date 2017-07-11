CREATE OR REPLACE FORCE VIEW "ATAF_APEX_PAGES_V" ("WORKSPACE", "WORKSPACE_DISPLAY_NAME", "APPLICATION_ID", "APPLICATION_NAME", "PAGE_ID", "PAGE_NAME", "PAGE_TITLE", "PAGE_MODE", "USER_INTERFACE_ID", "MEDIA_TYPE", "TAB_SET", "PAGE_ALIAS", "PAGE_FUNCTION", "ALLOW_DUPLICATE_SUBMISSIONS", "INCLUDE_APEX_CSS_JS_YN", "FOCUS_CURSOR", "HEADER_TEXT", "BODY_HEADER", "FOOTER_TEXT", "HELP_TEXT", "PAGE_TEMPLATE", "PAGE_CSS_CLASSES", "PAGE_TEMPLATE_OPTIONS", "AUTHORIZATION_SCHEME", "AUTHORIZATION_SCHEME_ID", "BUILD_OPTION", "PAGE_HTML_HEADER", "PAGE_HTML_ONLOAD", "JAVASCRIPT_FILE_URLS", "JAVASCRIPT_CODE", "JAVASCRIPT_CODE_ONLOAD", "CSS_FILE_URLS", "INLINE_CSS", "PAGE_REQUIRES_AUTHENTICATION", "PAGE_ACCESS_PROTECTION", "DIALOG_TITLE", "DIALOG_HEIGHT", "DIALOG_WIDTH", "DIALOG_MAX_WIDTH", "DIALOG_ATTRIBUTES", "DIALOG_CSS_CLASSES", "DIALOG_CHAINED", "OVERWRITE_NAVIGATION_LIST", "NAVIGATION_LIST", "NAVIGATION_LIST_ID", "NAVIGATION_LIST_TEMPLATE", "NAVIGATION_LIST_TEMPLATE_ID", "NAV_LIST_TEMPLATE_OPTIONS", "NAVIGATION_LIST_POSITION", "REGIONS", "ITEMS", "BUTTONS", "COMPUTATIONS", "VALIDATIONS", "PROCESSES", "BRANCHES", "REPORT_COLUMNS", "PAGE_GROUP", "PAGE_GROUP_ID", "ON_DUP_SUBMISSION_GOTO_URL", "ERROR_HANDLING_FUNCTION", "ERROR_NOTIFICATION_TEXT", "FORM_AUTOCOMPLETE", "PAGE_TRANSITION", "POPUP_TRANSITION", "READ_ONLY_CONDITION_TYPE", "READ_ONLY_CONDITION_TYPE_CODE", "READ_ONLY_CONDITION_EXP1", "READ_ONLY_CONDITION_EXP2", "CACHE_MODE", "CACHED", "CACHE_TIMEOUT_SECONDS", "CACHED_BY_USER", "CACHE_CONDITION_TYPE", "CACHE_CONDITION_EXP_1", "CACHE_CONDITION_EXP_2", "PAGE_COMMENT", "CACHED_REGIONS", "CREATED_BY", "CREATED_ON", "LAST_UPDATED_BY", "LAST_UPDATED_ON", "COMPONENT_SIGNATURE", "BROWSER_CACHE", "DEEP_LINKING", "REJOIN_EXISTING_SESSIONS", "RELOAD_ON_SUBMIT", "RELOAD_ON_SUBMIT_CODE", "WARN_ON_UNSAVED_CHANGES") AS 
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
--| S. Hunt         10-JUL-17 2       APEX_PAGES_MV changed to AGENT_PAGES_MV   |
--+=============================================================================+ 
"WORKSPACE","WORKSPACE_DISPLAY_NAME","APPLICATION_ID","APPLICATION_NAME","PAGE_ID","PAGE_NAME","PAGE_TITLE","PAGE_MODE","USER_INTERFACE_ID","MEDIA_TYPE","TAB_SET","PAGE_ALIAS","PAGE_FUNCTION","ALLOW_DUPLICATE_SUBMISSIONS","INCLUDE_APEX_CSS_JS_YN","FOCUS_CURSOR","HEADER_TEXT","BODY_HEADER","FOOTER_TEXT","HELP_TEXT","PAGE_TEMPLATE","PAGE_CSS_CLASSES","PAGE_TEMPLATE_OPTIONS","AUTHORIZATION_SCHEME","AUTHORIZATION_SCHEME_ID","BUILD_OPTION","PAGE_HTML_HEADER","PAGE_HTML_ONLOAD","JAVASCRIPT_FILE_URLS","JAVASCRIPT_CODE","JAVASCRIPT_CODE_ONLOAD","CSS_FILE_URLS","INLINE_CSS","PAGE_REQUIRES_AUTHENTICATION","PAGE_ACCESS_PROTECTION","DIALOG_TITLE","DIALOG_HEIGHT","DIALOG_WIDTH","DIALOG_MAX_WIDTH","DIALOG_ATTRIBUTES","DIALOG_CSS_CLASSES","DIALOG_CHAINED","OVERWRITE_NAVIGATION_LIST","NAVIGATION_LIST","NAVIGATION_LIST_ID","NAVIGATION_LIST_TEMPLATE","NAVIGATION_LIST_TEMPLATE_ID","NAV_LIST_TEMPLATE_OPTIONS","NAVIGATION_LIST_POSITION","REGIONS","ITEMS","BUTTONS","COMPUTATIONS","VALIDATIONS","PROCESSES","BRANCHES","REPORT_COLUMNS","PAGE_GROUP","PAGE_GROUP_ID","ON_DUP_SUBMISSION_GOTO_URL","ERROR_HANDLING_FUNCTION","ERROR_NOTIFICATION_TEXT","FORM_AUTOCOMPLETE","PAGE_TRANSITION","POPUP_TRANSITION","READ_ONLY_CONDITION_TYPE","READ_ONLY_CONDITION_TYPE_CODE","READ_ONLY_CONDITION_EXP1","READ_ONLY_CONDITION_EXP2","CACHE_MODE","CACHED","CACHE_TIMEOUT_SECONDS","CACHED_BY_USER","CACHE_CONDITION_TYPE","CACHE_CONDITION_EXP_1","CACHE_CONDITION_EXP_2","PAGE_COMMENT","CACHED_REGIONS","CREATED_BY","CREATED_ON","LAST_UPDATED_BY","LAST_UPDATED_ON","COMPONENT_SIGNATURE","BROWSER_CACHE","DEEP_LINKING","REJOIN_EXISTING_SESSIONS","RELOAD_ON_SUBMIT","RELOAD_ON_SUBMIT_CODE","WARN_ON_UNSAVED_CHANGES" FROM ATAF_AGENT_PAGES_MV
-------------------------------------------------------------------------------
-- The Apex View are only able to access application elements from the       --
-- applications parsing schema.  Therefore, you will need to add Agent MVs   --
-- to the parsing schemas of all the applications you want to test.  Then    --
-- grant select on the agent view to the ATAF schema and union them below eg --
-------------------------------------------------------------------------------
/*
UNION ALL
SELECT * FROM OTHER.ATAF_AGENT_PAGES_MV
*/
/
