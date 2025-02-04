CREATE OR REPLACE FORCE VIEW "ATAF_APEX_APPLICATION_PAGES_V" ("WORKSPACE", "WORKSPACE_DISPLAY_NAME", "APPLICATION_ID", "APPLICATION_NAME", "PAGE_ID", "PAGE_NAME", "PAGE_TITLE", "USER_INTERFACE_ID", "MEDIA_TYPE", "TAB_SET", "PAGE_ALIAS", "PAGE_FUNCTION", "ALLOW_DUPLICATE_SUBMISSIONS", "FOCUS_CURSOR", "HEADER_TEXT", "BODY_HEADER", "FOOTER_TEXT", "HELP_TEXT", "PAGE_TEMPLATE", "AUTHORIZATION_SCHEME", "AUTHORIZATION_SCHEME_ID", "BUILD_OPTION", "PAGE_HTML_HEADER", "PAGE_HTML_ONLOAD", "JAVASCRIPT_FILE_URLS", "JAVASCRIPT_CODE", "JAVASCRIPT_CODE_ONLOAD", "CSS_FILE_URLS", "INLINE_CSS", "PAGE_REQUIRES_AUTHENTICATION", "PAGE_ACCESS_PROTECTION", "REGIONS", "ITEMS", "BUTTONS", "COMPUTATIONS", "VALIDATIONS", "PROCESSES", "BRANCHES", "REPORT_COLUMNS", "PAGE_GROUP", "PAGE_GROUP_ID", "ON_DUP_SUBMISSION_GOTO_URL", "ERROR_HANDLING_FUNCTION", "ERROR_NOTIFICATION_TEXT", "FORM_AUTOCOMPLETE", "PAGE_TRANSITION", "POPUP_TRANSITION", "READ_ONLY_CONDITION_TYPE", "READ_ONLY_CONDITION_TYPE_CODE", "READ_ONLY_CONDITION_EXP1", "READ_ONLY_CONDITION_EXP2", "CACHED", "CACHE_TIMEOUT_SECONDS", "CACHED_BY_USER", "CACHE_CONDITION_TYPE", "CACHE_CONDITION_EXP_2", "PAGE_COMMENT", "CACHED_REGIONS", "CREATED_BY", "CREATED_ON", "LAST_UPDATED_BY", "LAST_UPDATED_ON", "COMPONENT_SIGNATURE", "BROWSER_CACHE", "DEEP_LINKING") AS 
  SELECT "WORKSPACE",
    "WORKSPACE_DISPLAY_NAME",
    "APPLICATION_ID",
    "APPLICATION_NAME",
    "PAGE_ID",
    "PAGE_NAME",
    "PAGE_TITLE",
    "USER_INTERFACE_ID",
    "MEDIA_TYPE",
    "TAB_SET",
    "PAGE_ALIAS",
    "PAGE_FUNCTION",
    "ALLOW_DUPLICATE_SUBMISSIONS",
    "FOCUS_CURSOR",
    "HEADER_TEXT",
    "BODY_HEADER",
    "FOOTER_TEXT",
    "HELP_TEXT",
    "PAGE_TEMPLATE",
    "AUTHORIZATION_SCHEME",
    "AUTHORIZATION_SCHEME_ID",
    "BUILD_OPTION",
    "PAGE_HTML_HEADER",
    "PAGE_HTML_ONLOAD",
    "JAVASCRIPT_FILE_URLS",
    "JAVASCRIPT_CODE",
    "JAVASCRIPT_CODE_ONLOAD",
    "CSS_FILE_URLS",
    "INLINE_CSS",
    "PAGE_REQUIRES_AUTHENTICATION",
    "PAGE_ACCESS_PROTECTION",
    "REGIONS",
    "ITEMS",
    "BUTTONS",
    "COMPUTATIONS",
    "VALIDATIONS",
    "PROCESSES",
    "BRANCHES",
    "REPORT_COLUMNS",
    "PAGE_GROUP",
    "PAGE_GROUP_ID",
    "ON_DUP_SUBMISSION_GOTO_URL",
    "ERROR_HANDLING_FUNCTION",
    "ERROR_NOTIFICATION_TEXT",
    "FORM_AUTOCOMPLETE",
    "PAGE_TRANSITION",
    "POPUP_TRANSITION",
    "READ_ONLY_CONDITION_TYPE",
    "READ_ONLY_CONDITION_TYPE_CODE",
    "READ_ONLY_CONDITION_EXP1",
    "READ_ONLY_CONDITION_EXP2",
    "CACHED",
    "CACHE_TIMEOUT_SECONDS",
    "CACHED_BY_USER",
    "CACHE_CONDITION_TYPE",
    "CACHE_CONDITION_EXP_2",
    "PAGE_COMMENT",
    "CACHED_REGIONS",
    "CREATED_BY",
    "CREATED_ON",
    "LAST_UPDATED_BY",
    "LAST_UPDATED_ON",
    "COMPONENT_SIGNATURE",
    "BROWSER_CACHE",
    "DEEP_LINKING"
  FROM apex_application_pages
  WHERE application_id = (SELECT nv('APPLICATION_ID') FROM dual)
  AND workspace = (select v('ATAF_WORKSPACE') x from dual)
/