DECLARE
  lv_workspace_id NUMBER;
BEGIN
  SELECT workspace_id INTO lv_workspace_id
  FROM apex_workspaces
  WHERE workspace = '&1';
  APEX_UTIL.SET_SECURITY_GROUP_ID(p_security_group_id=>lv_workspace_id);
  APEX_UTIL.REMOVE_USER(p_user_name => 'ADMIN_USER');
  APEX_UTIL.REMOVE_USER(p_user_name => 'BASIC_USER');
  APEX_UTIL.DELETE_USER_GROUP(p_group_name => 'ataf_administrator');
END;
/
commit;