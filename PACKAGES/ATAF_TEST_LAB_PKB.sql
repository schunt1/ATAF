CREATE OR REPLACE PACKAGE body ATAF_TEST_LAB
AS
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
  --| Description : Package for Test Lab integration.                             |
  --|                                                                             |
  --| Modification History :                                                      |
  --| ----------------------                                                      |
  --|                                                                             |
  --| Author          Date      Version Remarks                                   |
  --| --------------- --------- ------- ------------------------------------------
  --| S. Hunt         09-Apr-16 1       Initial Version                           |
  --+=============================================================================+
  g_wallet_path VARCHAR2(64) := ataf_test_lab.get_parameter('Wallet Path');
  g_wallet_pwd  VARCHAR2(32) := ataf_test_lab.get_parameter('Wallet Password');
  --+=============================================================================+
  --| Description : Uploads the Test Steps for a given specification.             |
  --|                                                                             |
  --| Modification History :                                                      |
  --| ----------------------                                                      |
  --|                                                                             |
  --| Author          Date      Version Remarks                                   |
  --| --------------- --------- ------- ------------------------------------------
  --| S. Hunt         09-Apr-16 1       Initial Version                           |
  --+=============================================================================+
  PROCEDURE MODIFY_TEST_STEPS(
      p_test_spec_id IN NUMBER,
      p_outcome OUT VARCHAR )
  AS
    l_arr1 apex_application_global.vc_arr2;
    l_arr2 apex_application_global.vc_arr2;
    l_clob CLOB;
    l_test_lab_test_id NUMBER;
    l_success          VARCHAR2(16);
    l_status_code ataf_tl_test.status_code%TYPE;
    l_username ataf_project.tl_username%TYPE;
    l_password ataf_project.tl_password%TYPE;
  BEGIN
    SELECT
      ats.test_lab_test_id,
      pro.tl_username,
      pro.tl_password
    INTO
      l_test_lab_test_id,
      l_username,
      l_password
    FROM
      ataf_test_spec ats
    LEFT JOIN ataf_project pro ON ats.project_id = pro.project_id
    WHERE
      ats.test_spec_id = p_test_spec_id;
    ataf_pkg.test( p_spec_id => p_test_spec_id, p_case_id => NULL, p_spec_case_id => NULL, p_domain => NULL, p_ws_name => l_arr1, p_ws_value => l_arr2);
    l_clob := apex_web_service.make_rest_request( p_url => 'https://api.testingbot.com/v1/lab/'||l_test_lab_test_id||'/steps', p_http_method => 'POST', p_username => l_username, p_password => l_password, p_parm_name => l_arr1, p_parm_value => l_arr2, p_wallet_path => g_wallet_path, p_wallet_pwd => g_wallet_pwd );
    apex_json.parse(l_clob);
    l_success     := apex_json.get_varchar2(p_path => 'success');
    l_status_code := apex_web_service.g_status_code;
    INSERT
    INTO
      ataf_tl_test
      (
        json,
        success,
        status_code,
        test_lab_test_id,
        test_date,
        test_spec_id
      )
      VALUES
      (
        l_clob,
        l_success,
        l_status_code,
        l_test_lab_test_id,
        sysdate,
        p_test_spec_id
      );
    IF l_success = 'true' THEN
      p_outcome := 'Success';
    ELSE
      p_outcome := 'Failure';
    END IF;
  END MODIFY_TEST_STEPS;
--+=============================================================================+
--| Description : Updates an entire project                                     |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         09-Apr-16 1       Initial Version                           |
--+=============================================================================+
  PROCEDURE upload_project
    (
      p_project_id IN NUMBER,
      p_outcome OUT VARCHAR
    )
  AS
    l_outcome VARCHAR2
    (
      32
    )
    ;
  BEGIN
    FOR i IN
    (SELECT
        test_spec_id
      FROM
        ataf_test_spec
      WHERE
        automate     = 'Y'
      AND project_id = p_project_id
      ORDER BY
        sort_order
    )
    LOOP
      ATAF_TEST_LAB.MODIFY_TEST_STEPS
      (
        i.test_spec_id,l_outcome
      )
      ;
      -- A failure trumps!
      IF l_outcome = 'Failure' THEN
        p_outcome := 'Failure';
      END IF;
    END LOOP;
    IF p_outcome != 'Failure' OR p_outcome IS NULL THEN
      p_outcome  := l_outcome;
    END IF;
  END upload_project;
--+=============================================================================+
--| Description : Runs an entire test lab suite                                 |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         09-Apr-16 1       Initial Version                           |
--+=============================================================================+
  PROCEDURE play_lab_suite
    (
      p_project_id IN NUMBER,
      p_job_id OUT NUMBER
    )
  AS
    l_test_lab_suite_id NUMBER;
    l_success           VARCHAR2(16);
    l_clob CLOB;
    l_username ataf_project.tl_username%TYPE;
    l_password ataf_project.tl_password%TYPE;
  BEGIN
    SELECT
      test_lab_suite_id,
      tl_username,
      tl_password
    INTO
      l_test_lab_suite_id,
      l_username,
      l_password
    FROM
      ataf_project
    WHERE
      project_id = p_project_id;
    l_clob      := apex_web_service.make_rest_request( p_url => 'https://api.testingbot.com/v1/labsuites/'||l_test_lab_suite_id||'/trigger', p_http_method => 'POST', p_username => l_username, p_password => l_password, p_wallet_path => g_wallet_path, p_wallet_pwd => g_wallet_pwd );
    apex_json.parse(l_clob);
    l_success := apex_json.get_varchar2(p_path => 'success');
    p_job_id  := apex_json.get_varchar2(p_path => 'job_id');
    INSERT
    INTO
      ataf_tl_job
      (
        job_id,
        project_id,
        success,
        json,
        job_date
      )
      VALUES
      (
        p_job_id,
        p_project_id,
        l_success,
        l_clob,
        sysdate
      );
    COMMIT;
  END play_lab_suite;
--+=============================================================================+
--| Description : Plays an entire lab test.                                     |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         09-Apr-16 1       Initial Version                           |
--+=============================================================================+
  PROCEDURE play_lab_test
    (
      p_test_spec_id IN NUMBER
    )
  AS
    l_test_lab_test_id NUMBER;
    l_success          VARCHAR2(16);
    l_job_id           NUMBER;
    l_clob CLOB;
    l_username ataf_project.tl_username%TYPE;
    l_password ataf_project.tl_password%TYPE;
  BEGIN
    SELECT
      ats.test_lab_test_id,
      pro.tl_username,
      pro.tl_password
    INTO
      l_test_lab_test_id,
      l_username,
      l_password
    FROM
      ataf_test_spec ats
    LEFT JOIN ataf_project pro ON ats.project_id = pro.project_id
    WHERE
      ats.test_spec_id = p_test_spec_id;
    l_clob            := apex_web_service.make_rest_request( p_url => 'https://api.testingbot.com/v1/lab/'||l_test_lab_test_id||'/trigger', p_http_method => 'POST', p_username => l_username, p_password => l_password, p_wallet_path => g_wallet_path, p_wallet_pwd => g_wallet_pwd );
    apex_json.parse(l_clob);
    l_success := apex_json.get_varchar2(p_path => 'success');
    l_job_id  := apex_json.get_varchar2(p_path => 'job_id');
    INSERT
    INTO
      ataf_tl_job
      (
        job_id,
        test_spec_id,
        success,
        json,
        job_date
      )
      VALUES
      (
        l_job_id,
        p_test_spec_id,
        l_success,
        l_clob,
        sysdate
      );
  END play_lab_test;
--+=============================================================================+
--| Description : Triggers a lab suite for use with Continuous Integration      |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         09-Apr-16 1       Initial Version                           |
--+=============================================================================+
  PROCEDURE ci_trigger
    (
      p_project_id IN NUMBER
    )
  AS
    l_upload_result VARCHAR2
    (
      16
    )
    ;
    l_job_id    NUMBER;
    l_status    VARCHAR2(16);
    l_limit     NUMBER := 0;
    l_exception EXCEPTION;
    PRAGMA EXCEPTION_INIT(l_exception, -20001);
  BEGIN
    ataf_test_lab.upload_project(p_project_id,l_upload_result);
    IF l_upload_result = 'Success' THEN
      dbms_output.put_line('Tests uploaded successfully.  ');
    ELSE
      raise_application_error( -20001, 'There was a problem uploading scripts.  ');
    END IF;
    ataf_test_lab.play_lab_suite(p_project_id, l_job_id);
    IF l_job_id IS NOT NULL THEN
      dbms_output.put_line('Test Lab job created: '||l_job_id);
    ELSE
      raise_application_error( -20001, 'There was a problem starting the Test Lat Tests.  ' );
    END IF;
    LOOP
      dbms_lock.sleep(60);
      dbms_output.put_line('Pole '||l_limit||': '||l_limit * 60||'Sec.  ');
      SELECT run_success INTO l_status FROM ataf_tl_job WHERE job_id = l_job_id;
      l_limit := l_limit + 1;
      EXIT
    WHEN l_status IS NOT NULL OR l_limit = 5;
    END LOOP;
    dbms_output.put_line('Test Completed: '||l_limit * 60||'Sec.  ');
    IF l_status IS NULL THEN
      raise_application_error( -20001, 'The test returned no results.  ' );
    ELSIF l_status = 'false' THEN
      raise_application_error( -20001, 'The test returned with errors.  ' );
    ELSE
      dbms_output.put_line('All tests passed');
    END IF;
  EXCEPTION
  WHEN l_exception THEN
    dbms_output.put_line(sqlerrm);
  END ci_trigger;
--+=============================================================================+
--| Description : Function to return values from the System Paramters table     |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         09-Apr-16 1       Initial Version                           |
--+=============================================================================+
  FUNCTION get_parameter(
      p_parameter_name IN VARCHAR2)
    RETURN VARCHAR2
  AS
    l_parameter ataf_system_parameters.value%TYPE;
  BEGIN
    SELECT
      value
    INTO
      l_parameter
    FROM
      ataf_system_parameters
    WHERE
      name = p_parameter_name;
    RETURN l_parameter;
  END get_parameter;
END "ATAF_TEST_LAB";
/