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
 p_id=>wwv_flow_api.id(21764150256345751)
,p_name=>'testingbot'
);
 
end;
/
prompt --application/restful_services/testingbot
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(21764150256345751)
,p_name=>'testingbot'
,p_uri_prefix=>'testingbot/'
,p_parsing_schema=>'ATAF'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>79
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(21764277164345752)
,p_module_id=>wwv_flow_api.id(21764150256345751)
,p_uri_template=>'callback'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(21764303238345756)
,p_template_id=>wwv_flow_api.id(21764277164345752)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_mimes_allowed=>'application/json'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'  l_clob CLOB := ''X'';  ',
'  l_dest_offsset INTEGER := 1;  ',
'  l_src_offsset INTEGER := 1;  ',
'  l_lang_context INTEGER := dbms_lob.default_lang_ctx;  ',
'  l_warning INTEGER; ',
'  l_job_id NUMBER;',
'  l_success VARCHAR2(8);',
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
'                           ',
'  apex_json.parse(l_clob);',
'        ',
'  l_job_id  := apex_json.get_varchar2(p_path => ''job_id'');',
'  l_success := apex_json.get_varchar2(p_path => ''success'');',
'  ',
'  UPDATE testingbot_jobs ',
'  SET status = l_success',
'  WHERE testingbot_job_id = l_job_id;',
'',
'  -- Add the Tests --',
'  ',
'  INSERT INTO testingbot_tests',
'  (testingbot_test_id, testingbot_job_id)',
'  (SELECT id, l_job_id',
'            FROM json_table (l_clob, ''$.test_ids[*]'' ',
'            COLUMNS ("id" path ''$''))); ',
'',
'  -- Loop through errors --',
'  ',
'  INSERT INTO testingbot_errors',
'  (SELECT null testingbot_error_id,',
'          msg,',
'          step,',
'          browser_name,',
'          browser_version,',
'          browser_os,',
'          to_date(substr(time,1,19),''YYYY-MM-DD HH24:MI:SS''),',
'          test_id,',
'          job_id,',
'          lab_id',
'         FROM json_table ',
'              (l_clob, ''$.errors[*]''',
'         COLUMNS (',
'                  "msg"             path ''$.msg'',',
'                  "step"            path ''$.step'',',
'                  "browser_name"    path ''$.browser.name'',',
'                  "browser_version" path ''$.browser.version'',',
'                  "browser_os"      path ''$.browser.os'',',
'                  "time"            path ''$.time'',',
'                  "test_id"         path ''$.test_id'',',
'                  "job_id"          path ''$.job_id'',',
'                  "lab_id"          path ''$.lab_id''',
'                 )',
'              ));',
'  ',
'  htp.p(''{sucess:true}'');',
'  ',
'EXCEPTION WHEN OTHERS THEN',
'  ',
'  INSERT INTO testingbot_json ',
'  (testingbot_json_id,',
'   json,',
'   date_time)',
'  VALUES',
'  (null,',
'   l_clob,',
'   sysdate);',
'   ',
'   htp.p(''{sucess:false}'');  ',
'  ',
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
