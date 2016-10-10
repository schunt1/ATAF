create or replace PACKAGE  "ATAF_PKG" 
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
--| Description : Package for all general functions and procedures              |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--| S. Hunt         10-Oct-15 2       Tes Prodedure updated                     |
--+=============================================================================+
--
--+=============================================================================+
--| Description : Type for converting colon sperated lists into tables          |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
TYPE ret_val_t
IS
  TABLE OF VARCHAR(4000);
--
--+=============================================================================+
--| Description : Pipleline function for return a colon separated list into a   |
--|               table.                                                        |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION checkbox_table(
      p_checkbox VARCHAR2)
    RETURN ret_val_t PIPELINED;
--
--+=============================================================================+
--| Description : Oracle function for converting a PK ID into a unique string   |
--|               This is very useful for using as a ref                        |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION "COMPRESS_INT"(
      n IN INTEGER )
    RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : Procedure that generates the selenium scripts.                |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--| S. Hunt         10-Oct-15 2       specCase added                            |
--+=============================================================================+
  PROCEDURE test(
      p_spec_id IN NUMBER,
      p_case_id IN NUMBER,
      p_spec_case_id IN NUMBER,
      p_domain  IN VARCHAR2
    );
--
--+=============================================================================+
--| Description : function that performs the Replace for substitution strings   |
--|               used in the creation of the Selenium scripts                  |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION test_func(
      p_id                 IN NUMBER,
      p_target             IN VARCHAR2,
      p_dom_id             IN VARCHAR2,
      p_name               IN VARCHAR2,
      p_label              IN VARCHAR2,
      p_data               IN VARCHAR2,
      p_page_title         IN VARCHAR2,
      p_element            IN VARCHAR2,
      p_application_id     IN NUMBER,
      p_page_id            IN VARCHAR2,
      p_row                IN VARCHAR2,
      p_region_id          IN VARCHAR2,
      p_region_name        IN VARCHAR2,
      p_domain             IN VARCHAR2,
      p_outcome_page_id    IN VARCHAR2,
      p_outcome_page_title IN VARCHAR2)
    RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : new version of apex_util.current_user_in_group to rtn varchar |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         17-Jul-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION current_user_in_group(
      p_group_name IN VARCHAR2)
    RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : returns test data columns                                     |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION return_cols RETURN VARCHAR2;
--
--+=============================================================================+
--| Description : returns the start date of the financial year                  |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         19-Jul-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION return_fy_start (
      p_date IN DATE)
      RETURN DATE;
--
--+=============================================================================+
--| Description : returns a random data item for a specified attribute number   |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         18-Aug-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION random_data (
      p_attribute    IN NUMBER,
      p_test_data_id IN NUMBER)
      RETURN VARCHAR;
--
--+=============================================================================+
--| Description : Pipleline function for return a separated list into a tavle   |
--|                                                                             |
--| Modification History :                                                      |
--| ----------------------                                                      |
--|                                                                             |
--| Author          Date      Version Remarks                                   |
--| --------------- --------- ------- ------------------------------------------
--| S. Hunt         04-Mar-15 1       Initial Version                           |
--+=============================================================================+
  FUNCTION ret_table(
      p_string VARCHAR2, p_separator VARCHAR2)
    RETURN ret_val_t PIPELINED;
END;
/