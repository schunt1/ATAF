set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_default_workspace_id=>19253407352267231
);
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(74907154278383103)
,p_name=>'testlab'
);
 
end;
/
prompt --application/restful_services/testlab
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(74907154278383103)
,p_name=>'testlab'
,p_parsing_schema=>'ATAF'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>29
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(65750360329211405)
,p_module_id=>wwv_flow_api.id(74907154278383103)
,p_uri_template=>'ci/{projectId}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(65750442447218879)
,p_template_id=>wwv_flow_api.id(65750360329211405)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  ataf_test_lab.ci_trigger(:projectId);',
'  htp.p(''*** ATAF Complete'');',
'EXCEPTION when others THEN',
'  htp.p(''-1'');',
'END;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(74907318403383106)
,p_module_id=>wwv_flow_api.id(74907154278383103)
,p_uri_template=>'testlab/'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(74907373334386435)
,p_template_id=>wwv_flow_api.id(74907318403383106)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'YES'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_clob CLOB := ''X'';  ',
'  l_dest_offsset INTEGER := 1;  ',
'  l_src_offsset INTEGER := 1;  ',
'  l_lang_context INTEGER := dbms_lob.default_lang_ctx;  ',
'  l_warning INTEGER; ',
'  l_job_id       ataf_tl_job.job_id%TYPE;',
'  l_test_ids     ataf_tl_job.test_ids%TYPE;',
'  l_errors       ataf_tl_job.errors%TYPE;',
'  l_success      ataf_tl_job.run_success%TYPE;',
'  l_status_code  ataf_tl_job.status_code%TYPE;',
'',
'BEGIN',
'',
'    dbms_lob.converttoclob(dest_lob => l_clob,  ',
'                           src_blob => :body,  ',
'                           amount => dbms_lob.lobmaxsize,  ',
'                           dest_offset => l_dest_offsset,  ',
'                           src_offset => l_src_offsset,  ',
'                           blob_csid => dbms_lob.default_csid,  ',
'                           lang_context => l_lang_context,  ',
'                           warning => l_warning);',
'',
'',
'    ',
'    apex_json.parse(l_clob);',
'    l_success     := apex_json.get_varchar2(p_path => ''success'');',
'    l_job_id      := apex_json.get_varchar2(p_path => ''job_id'');',
' --   l_test_ids    := apex_json.get_varchar2(p_path => ''test_ids'');',
'    l_errors      := apex_json.get_varchar2(p_path => ''errors/msg'');',
'',
'    ',
'    UPDATE ataf_tl_job SET',
'      run_success = l_success,',
'      test_ids = l_test_ids,',
'      errors = l_errors,',
'      json = l_clob',
'    WHERE job_id = l_job_id;',
'   ',
'    commit;',
'    ',
'END;'))
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
