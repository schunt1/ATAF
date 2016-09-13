set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_default_workspace_id=>44984712792917604
);
end;
/
prompt  Set Application Offset...
begin
   -- SET APPLICATION OFFSET
   wwv_flow_api.g_id_offset := nvl(wwv_flow_application_install.get_offset,0);
null;
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(88620544943979241)
,p_name=>'Selenium Web Services'
);
 
end;
/
prompt --application/restful_services/selenium_web_services
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(88620544943979241)
,p_name=>'Selenium Web Services'
,p_parsing_schema=>'SHUNT'
,p_items_per_page=>100000
,p_status=>'PUBLISHED'
,p_row_version_number=>72
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(88930788888843007)
,p_module_id=>wwv_flow_api.id(88620544943979241)
,p_uri_template=>'seleinium.junit.report/{result_id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(88930878330844703)
,p_template_id=>wwv_flow_api.id(88930788888843007)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'  lv_test_spec_id NUMBER;',
'',
'BEGIN',
'',
'htp.p(''<?xml version="1.0" encoding="UTF-8"?>',
'<testsuites>'');',
'',
'  ----------------------------',
'  -- Loop through test spec --',
'  ----------------------------',
'  FOR i IN (SELECT ats.test_spec_id,',
'                   ats.test_spec,',
'                   ats.last_updated_date,',
'                   ats.sort_order,',
'                   res.result_spec_id,',
'                   res.num_test_failure,',
'                   res.num_test_total,',
'                   res.num_test_error,',
'                   res.total_time,',
'                   to_char(res.date_loaded,''YYYY-MM-DD"T"HH24:MI:SS'') date_loaded',
'            FROM ataf_test_spec ats ',
'            JOIN ataf_spec_result res ON ats.test_spec_id = res.test_spec_id AND res.result_id = :result_id',
'            WHERE ats.automate = ''Y'') LOOP',
'  htp.p(''  <testsuite name="''||i.test_spec||''" errors="''||i.num_test_error||''" tests="''||i.num_test_total||''" failures="''||i.num_test_failure||''" time="''||i.total_time||''" timestamp="''||i.date_loaded||''">'');',
'',
'    FOR j IN (SELECT',
'                sc.test_case_id,',
'                trim(to_char(sc.sort_order,''000'')) sort_order,',
'                atc.test_case,',
'                acr.result,',
'                acr.error_msg',
'              FROM ataf_spec_case sc',
'              JOIN ataf_test_case atc ON sc.test_case_id = atc.test_case_id',
'              LEFT OUTER JOIN ataf_case_result acr ON atc.test_case_id = acr.test_case_id AND acr.result_spec_id = i.result_spec_id',
'              WHERE sc.test_spec_id = i.test_spec_id',
'              ORDER BY sc.sort_order) LOOP',
'',
'      htp.p(''    <testcase name="''||i.test_spec||''.''||j.sort_order||''.''||j.test_case||''" >'');',
'      ',
'      IF j.error_msg IS NOT NULL THEN',
'      ',
'        htp.p(''    <failure message="''||j.error_msg||''" ></failure>'');',
'      ',
'      END IF;',
'      ',
'      htp.p(''    </testcase>'');',
'',
'    END LOOP;',
'  ',
'  htp.p(''  </testsuite>'');',
'',
'  END LOOP;',
'',
'htp.p(''</testsuites>'');',
'',
'END;',
''))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(88809147359712926)
,p_module_id=>wwv_flow_api.id(88620544943979241)
,p_uri_template=>'selenium.case.json/{spec_id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(88809202372732769)
,p_template_id=>wwv_flow_api.id(88809147359712926)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT * FROM (',
'    SELECT sc.test_spec_id,',
'         sc.test_case_id,',
'         --tc.test_case',
'         ''Case_''||sc.test_case_id test_case',
'    FROM ataf_spec_case sc,',
'         ataf_test_case tc',
'   WHERE sc.test_case_id = tc.test_case_id',
'     AND sc.test_spec_id = :spec_id',
'ORDER BY sc.sort_order)',
'UNION ALL',
'  SELECT',
'    to_number(:spec_id),',
'    0,',
'    ''Upload_Results_File_''||to_number(:spec_id)',
'  From ',
'    dual',
''))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(90196784231800515)
,p_module_id=>wwv_flow_api.id(88620544943979241)
,p_uri_template=>'selenium.junit.create/{build_id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(90196850014802484)
,p_template_id=>wwv_flow_api.id(90196784231800515)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'  lv_result_id VARCHAR2(255);',
'  ',
'BEGIN',
'',
'  UPDATE ataf_result',
'  SET current_yn = null',
'  WHERE current_yn = ''Y'';',
'',
'  INSERT INTO ataf_result',
'    (build_number,',
'     current_yn)',
'  VALUES',
'    (:build_id,',
'     ''Y'')',
'  RETURNING result_id INTO lv_result_id;',
'  ',
'-- JSON',
'  htp.p(''{',
'    "result_id": "''||lv_result_id||''"',
'}'');',
'  ',
'END;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(88620655392979242)
,p_module_id=>wwv_flow_api.id(88620544943979241)
,p_uri_template=>'selenium.suite.json/{application_id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(88620711055979244)
,p_template_id=>wwv_flow_api.id(88620655392979242)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  SELECT ts.test_spec_id,',
'         ts.test_spec,',
'         ts.module_id',
'    FROM ataf_test_spec ts, ',
'         ataf_project pr',
'   WHERE ts.project_id = pr.project_id',
'     AND pr.application_id IN (select to_number(column_value) from table (ataf_pkg.ret_table(:application_id,''$''))) ',
'     AND ts.automate = ''Y''',
'ORDER BY ts.sort_order'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(88620812426982583)
,p_module_id=>wwv_flow_api.id(88620544943979241)
,p_uri_template=>'selenium.test.json/{spec_id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(88620965395984467)
,p_template_id=>wwv_flow_api.id(88620812426982583)
,p_source_type=>'QUERY'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'YES'
,p_source=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'SELECT ts.test_spec_id,',
'         ts.test_spec,',
'         ts.module_id',
'    FROM ataf_test_spec ts, ',
'         ataf_project pr',
'   WHERE ts.project_id = pr.project_id',
'     AND ts.test_spec_id = :spec_id',
'     AND ts.automate = ''Y''',
'ORDER BY ts.sort_order'))
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
