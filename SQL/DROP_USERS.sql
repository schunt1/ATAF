BEGIN
  APEX_UTIL.REMOVE_USER(p_user_name => 'ADMIN_USER');
  APEX_UTIL.REMOVE_USER(p_user_name => 'BASIC_USER');
  APEX_UTIL.DELETE_USER_GROUP(p_group_name => 'ataf_administrator');
END;
/
commit;