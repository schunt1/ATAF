CREATE OR REPLACE PACKAGE ATAF_TEST_LAB
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
  --
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
  PROCEDURE modify_test_steps(
      p_test_spec_id IN NUMBER,
      p_outcome OUT VARCHAR);
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
  PROCEDURE upload_project(
      p_project_id IN NUMBER,
      p_outcome OUT VARCHAR);
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
  PROCEDURE play_lab_suite(
      p_project_id IN NUMBER,
      p_job_id OUT NUMBER);
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
  PROCEDURE play_lab_test(
      p_test_spec_id IN NUMBER);
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
  PROCEDURE ci_trigger(
      p_project_id IN NUMBER);
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
    RETURN VARCHAR2;
END ATAF_TEST_LAB;
/