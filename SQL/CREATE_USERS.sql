DECLARE
  lv_group_id VARCHAR2(256);
  lv_workspace_id NUMBER;
BEGIN
  SELECT workspace_id INTO lv_workspace_id
  FROM apex_workspaces
  WHERE workspace = 'ATAF';
  APEX_UTIL.SET_SECURITY_GROUP_ID(p_security_group_id=>lv_workspace_id);
  APEX_UTIL.CREATE_USER_GROUP(p_group_name => 'ataf_administrator');
  lv_group_id := APEX_UTIL.GET_GROUP_ID(p_group_name => 'ataf_administrator');
  APEX_UTIL.CREATE_USER(
    p_user_name => 'ADMIN_USER',
    p_description => 'Test User created by CI process',
    p_email_address => 'simon@apextestautomation.co.uk',
    p_web_password => 'Password1!',
    p_change_password_on_first_use => 'N',
    p_group_ids => lv_group_id);
  APEX_UTIL.CREATE_USER(
    p_user_name => 'BASIC_USER',
    p_description => 'Test User created by CI process',
    p_email_address => 'simon@apextestautomation.co.uk',
    p_web_password => 'Password1!',
    p_change_password_on_first_use => 'N',
    p_group_ids => '');
END;
/
commit;