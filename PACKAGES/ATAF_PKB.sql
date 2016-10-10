create or replace PACKAGE BODY  "ATAF_PKG" 
IS
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
--| S. Hunt         02-Jul-16 2       Update to Test procedure                  |
--| S. Hunt         19-Jul-16 3       Data groups in Test Procedure             |
--| S. Hunt         09-Aug-16 4       Update to Test Procedure                  |
--| S. Hunt         09-Aug-16 5       Update to Test Procedure                  |
--| S. Hunt         11-Aug-16 6       Load Result File Added                    |
--| S. Hunt         25-Sep-16 7       apex_escape.html                          |
--| S. Hunt         10-Oct-15 8       Test pkg updated                          |
--| S. Hunt         10-Oct-15 9       Test pkg bug fix                          |
--+=============================================================================+
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
  RETURN ret_val_t PIPELINED
IS
  l_vc_arr2 apex_application_global.vc_arr2;
BEGIN
  l_vc_arr2 := apex_util.string_to_table(p_checkbox);
  FOR z IN 1 .. l_vc_arr2.COUNT
  LOOP
    PIPE ROW(l_vc_arr2(z));
  END LOOP;
END checkbox_table;
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
  RETURN VARCHAR2
IS
  ret       VARCHAR2(30);
  quotient  INTEGER;
  remainder INTEGER;
  digit     CHAR(1);
BEGIN
  ret           := '';
  quotient      := n;
  WHILE quotient > 0
  LOOP
    remainder   := mod(quotient, 10 + 26);
    quotient    := floor(quotient   / (10 + 26));
    IF remainder < 26 THEN
      digit     := chr(ascii('A') + remainder);
    ELSE
      digit := chr(ascii('0') + remainder - 26);
    END IF;
    ret := digit || ret;
  END LOOP ;
  IF LENGTH(ret) < 5 THEN
    ret         := lpad(ret, 4, 'A');
  END IF ;
  RETURN ret;
END compress_int;
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
--+=============================================================================+
FUNCTION TEST_FUNC(
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
  RETURN VARCHAR2
IS
  l_str VARCHAR2(4000) := p_target;
BEGIN
  l_str := REPLACE(l_str,'#ID#',p_id);
  l_str := REPLACE(l_str,'#DOM_ID#',p_dom_id);
  l_str := REPLACE(l_str,'#NAME#',p_name);
  l_str := REPLACE(l_str,'#LABEL#',p_label);
  l_str := REPLACE(l_str,'#DATA#',p_data);
  l_str := REPLACE(l_str,'#PAGE TITLE#',p_page_title);
  l_str := REPLACE(l_str,'#PAGE ID#',p_page_id);
  l_str := REPLACE(l_str,'#ROW#',p_row);
  l_str := REPLACE(l_str,'#REGION ID#',p_region_id);
  l_str := REPLACE(l_str,'#APP ID#',p_application_id);
  l_str := REPLACE(l_str,'#REGION NAME#',p_region_name);
  l_str := REPLACE(l_str,'#DOMAIN#',p_domain);
  l_str := REPLACE(l_str,'#OUTCOME PAGE ID#',p_outcome_page_id);
  l_str := REPLACE(l_str,'#OUTCOME PAGE TITLE#',p_outcome_page_title);
  --Replace substitution strings
  BEGIN
    FOR i IN
    (SELECT shortcut, shortcut_name FROM apex_application_shortcuts
    )
    LOOP
      l_str := REPLACE(l_str,'#'||i.shortcut_name||'#',i.shortcut);
    END LOOP;
  EXCEPTION
  WHEN OTHERS THEN
    NULL;
  END;
  RETURN l_str;
EXCEPTION
WHEN OTHERS THEN
  RETURN 'ERROR';
END TEST_FUNC;
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
--| S. Hunt         02-Jul-16 2       ClickAt added to AndWait commands         |
--| S. Hunt         19-Jul-16 3       Filter case groups to data groups         |
--| S. Hunt         09-Aug-16 4       Test Spec in its entirity                 |
--| S. Hunt         09-Aug-16 5       Test Spec & Name added to data            |
--| S. Hunt         11-Aug-16 6       Load Results File added                   |
--| S. Hunt         25-Sep-16 7       apex_escape.html                          |
--| S. Hunt         10-Oct-15 8       specCase added                            |
--| S. Hunt         10-Oct-15 9       specCase used for results file            |
--+=============================================================================+
PROCEDURE TEST(
      p_spec_id      IN NUMBER,
      p_case_id      IN NUMBER,
      p_spec_case_id IN NUMBER,
      p_domain       IN VARCHAR2
  )
IS
  l_application_id NUMBER;
  l_test_name ataf_project.project_name%TYPE;
  l_test_case_old ataf_test_case.test_case%TYPE;
  l_theme_number NUMBER;
  l_upload_results_script VARCHAR2(4000);
  results_load_only EXCEPTION;
BEGIN

  IF p_spec_case_id = 0 THEN
    
    RAISE results_load_only;
    
  END IF;
  
  -----------------------------------------
  -- Get project name and application id --
  -- as this might be called from a WS   --  
  -----------------------------------------    
  IF p_spec_case_id IS NOT NULL  -- if a test case for a spec is provided
    THEN
    SELECT tc.test_case,
      p.application_id,
      aat.theme_number
    INTO l_test_name,
      l_application_id,
      l_theme_number
    FROM ataf_test_case tc,
      ataf_spec_case sc,
      ataf_project p,
      apex_application_themes aat
    WHERE 
        tc.test_case_id = sc.test_case_id
    AND sc.spec_case_id = p_spec_case_id    
    AND tc.project_id = p.project_id
    AND p.application_id = aat.application_id
    AND aat.is_current = 'Yes'
    AND aat.ui_type_name = 'DESKTOP';
  ELSIF p_spec_id IS NOT NULL  -- Spec in its entirety
    THEN
    SELECT tp.test_spec,
      p.application_id,
      aat.theme_number,
      replace(P.upload_results_script,'#TEST_SPEC_ID#',tp.test_spec_id)
    INTO l_test_name,
      l_application_id,
      l_theme_number,
      l_upload_results_script
    FROM ataf_test_spec tp,
      ataf_project p,
      apex_application_themes aat
    WHERE tp.project_id = p.project_id
    AND tp.test_spec_id = p_spec_id
    AND p.application_id = aat.application_id
    AND aat.is_current = 'Yes'
    AND aat.ui_type_name = 'DESKTOP';
  ELSE                      -- if a test case is provided
    SELECT tc.test_case,
      p.application_id,
      aat.theme_number
    INTO l_test_name,
      l_application_id,
      l_theme_number
    FROM ataf_test_case tc,
      ataf_project p,
      apex_application_themes aat
    WHERE tc.project_id = p.project_id
    AND tc.test_case_id = p_case_id
    AND p.application_id = aat.application_id
    AND aat.is_current = 'Yes'
    AND aat.ui_type_name = 'DESKTOP';
  END IF;
  ----------------------
  -- Initialise table --
  ----------------------
    htp.p('<table cellpadding="1" cellspacing="1" border="1">');
    htp.p('<thead>');
    htp.p('<tr><td rowspan="1" colspan="3">'||apex_escape.html(l_test_name)||'</td></tr>');
    htp.p('</thead><tbody>');
    
    
FOR i IN (

      WITH x AS
    
(
----------------------------
-- Complete Specification --
----------------------------
 SELECT sc.test_case_id,
        sc.sort_order,
        decode(sc.data_id,0,ad.data_id,sc.data_id)  data_id,
        ad.data_group_id data_group_id,
        sc.data_group_id spec_group_id
  FROM ataf_spec_case sc
  JOIN ataf_test_case tc ON sc.test_case_id = tc.test_case_id
  LEFT OUTER JOIN ataf_data ad ON tc.test_data_id = ad.test_data_id
                               AND (sc.data_group_id = ad.data_group_id or sc.data_group_id IS NULL)
                               AND (sc.data_id = ad.data_id or sc.data_id = 0)
  WHERE sc.test_spec_id = p_spec_id
    AND sc.test_case_id = nvl(p_case_id,sc.test_case_id) -- added to return case for a spec
------------------------------------
-- Called from Test Specification --
------------------------------------
 UNION ALL
 SELECT sc.test_case_id,
        sc.sort_order,
        decode(sc.data_id,0,ad.data_id,sc.data_id)  data_id,
        ad.data_group_id data_group_id,
        sc.data_group_id spec_group_id
  FROM ataf_spec_case sc
  JOIN ataf_test_case tc ON sc.test_case_id = tc.test_case_id
  LEFT OUTER JOIN ataf_data ad ON tc.test_data_id = ad.test_data_id
                               AND (sc.data_group_id = ad.data_group_id or sc.data_group_id IS NULL)
                               AND (sc.data_id = ad.data_id or sc.data_id = 0)
  WHERE sc.spec_case_id = p_spec_case_id    
----------------------------
-- Called from Test Case  --
----------------------------
  UNION ALL
  SELECT
        cas.test_case_id,
        0 sort_order,
        null data_id,
        null,
        dat.default_data_group_id data_group_id
  FROM
  ataf_test_case cas
  LEFT OUTER JOIN ataf_test_data dat ON cas.test_data_id = dat.test_data_id
  WHERE cas.test_case_id = p_case_id
    AND p_spec_id IS NULL  -- added to return case for a spec
)
      
-----------------
-- MAIN CURSOR --
-----------------
SELECT
    
    -----------------
    -- Data Groups --
    -----------------
    x.spec_group_id    spec_group_id,
    x.data_group_id    case_group_id,
    tcv.data_group_id  cond_group_id,
    tdv.data_group_id  data_group_id,

    -----------------
    tcv.test_case,
    -- Command --
    CASE
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'click' THEN 'clickAndWait'
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'clickAt' THEN 'clickAtAndWait'
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'type' THEN 'typeAndWait'
      WHEN tcv.and_wait = 'Y' AND sel.selenium_command = 'select' THEN 'selectAndWait'
      ELSE sel.selenium_command
    END command,
    -------------
    -- Target --
    -------------
    CASE
        -- Custom
        -- e.g.WHEN se.row_key = 'AACO' THEN XYZ
        -- Standard
      WHEN sel.item_attribute = 'DOM ID'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||tcv.dom_id
      WHEN sel.item_attribute = 'Name'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||tcv.name
      WHEN sel.item_attribute = 'Label'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||tcv.label
      WHEN sel.item_attribute = 'Data'
      THEN nvl2(sel.location,sel.location
        ||'=',NULL)
        ||nvl(tcv.data_item_value,tdv.data_item_value)
      ELSE nvl2(sel.location,sel.location
        ||'=',NULL)
        ||test_func( p_id => tcv.id, p_target => sel.target, p_dom_id => tcv.dom_id, p_name => tcv.name, p_label => tcv.label, p_data => nvl(tcv.data_item_value,tdv.data_item_value), p_page_title => tcv.page_title, p_element => tcv.element_type, p_application_id => tcv.application_id, p_page_id => tcv.page_id, p_row => tcv.row_number, p_region_id => tcv.region_id, p_region_name => tcv.region_name, p_domain => p_domain, p_outcome_page_id => tcv.outcome_page_id, p_outcome_page_title => tcv.outcome_page_title)
    END target,
    -----------
    -- Value --
    -----------
    CASE
      WHEN sel.data_yn = 'X' THEN tcv.name
      WHEN sel.data_yn = 'Y' THEN nvl(tcv.data_item_value,tdv.data_item_value) -- when selenium command is expecting data
      WHEN sel.data_yn = 'L' THEN 'label='||nvl(tcv.data_item_value,tdv.data_item_value) -- Prefix data with Label=
      WHEN sel.data_yn = 'A' THEN 'label='||tcv.label -- Prefix data with Label=
      WHEN sel.data_yn = 'S' THEN to_char(p_spec_id)
      ELSE NULL
    END value
    ----------
FROM
  ataf_test_condition_full_v tcv
  JOIN ataf_selenium sel ON tcv.action_id = sel.action_id
                        AND tcv.theme_number = sel.theme_number
  JOIN x ON tcv.test_case_id = x.test_case_id
  LEFT OUTER JOIN ataf_full_test_data_v tdv ON tcv.test_data_id   = tdv.test_data_id
                                           AND tcv.data_attribute = tdv.attribute      
                                           AND nvl(tdv.data_id,0) = nvl(x.data_id,0)

---------------------------------------------------------------
            
ORDER BY
  x.sort_order,
  x.data_id,
  tcv.con_sort_order,
  sel.sort_order
    
---------------------------------------------------------------
)
  LOOP
    IF l_test_case_old IS NULL OR l_test_case_old != i.test_case THEN
      htp.p('<!--Test Case: '||apex_escape.html(i.test_case)||'-->');
    END IF;
    
    -----------------------------------------------
    -- Group Logic that ensure cond gp = data gp --
    -----------------------------------------------
    
    IF i.case_group_id + i.cond_group_id IS NULL 
      OR (NVL(i.case_group_id,0) = NVL(i.cond_group_id,0)) THEN
      
      htp.p('<tr>');
      htp.p('<td>'||apex_escape.html(i.command)||'</td>');
      htp.p('<td>'||apex_escape.html(i.target)||'</td>');
      htp.p('<td>'||apex_escape.html(i.value)||'</td>');

      ----------------------------------------------------------
      --   Debug to display group values - view in Sel Spec   --
      ----------------------------------------------------------
    --htp.p('<td>'||apex_escape.html(i.spec_group_id)||'</td>');
    --htp.p('<td>'||apex_escape.html(i.case_group_id)||'</td>');
    --htp.p('<td>'||apex_escape.html(i.cond_group_id)||'</td>');
    --htp.p('<td>'||apex_escape.html(i.data_group_id)||'</td>');
      
      htp.p('</tr>');
    
    END IF;
   
    l_test_case_old := i.test_case;
    
  END LOOP;
  htp.p('</tbody></table>');
  
EXCEPTION WHEN results_load_only THEN

    SELECT 
      replace(p.upload_results_script,'#TEST_SPEC_ID#',tp.test_spec_id)
    INTO 
      l_upload_results_script
    FROM ataf_test_spec tp,
      ataf_project p
    WHERE tp.project_id = p.project_id
    AND tp.test_spec_id = p_spec_id;
    
    htp.p(l_upload_results_script);

      
END TEST;
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
    p_group_name IN VARCHAR2) RETURN varchar2
IS
BEGIN
    IF APEX_UTIL.CURRENT_USER_IN_GROUP(p_group_name) = true THEN
      RETURN 'Y';
    ELSE
       RETURN 'N';
    END IF;
END current_user_in_group;
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
FUNCTION return_cols RETURN VARCHAR2
IS
  lv_cols varchar2(4000);
BEGIN
  SELECT '::Group:Row Name:'||LISTAGG(data_item_name, ':') WITHIN GROUP (ORDER BY data_attribute) INTO lv_cols
  FROM ataf_data_item
  WHERE test_data_id = (SELECT nv('TEST_DATA_ID') FROM dual);
  RETURN lv_cols;
EXCEPTION when others THEN
  RETURN null;
END return_cols;
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
FUNCTION return_fy_start (p_date IN DATE) RETURN DATE
IS
    lv_date VARCHAR2(16);
BEGIN
      IF EXTRACT(month FROM p_date) > 3 then
        lv_date := '01-APR-'||to_char(p_date,'YYYY');  
      ELSE
        lv_date := '01-APR-'||to_char(EXTRACT(YEAR FROM p_date)-1);
      END IF;
      
      RETURN to_date(lv_date,'DD-MON-YYYY');
END return_fy_start;
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
    RETURN VARCHAR
IS
  lv_val ataf_data.attribute_1%type;
BEGIN
  SELECT  decode(p_attribute,
    0,attribute_1,
    1,attribute_2,
    2,attribute_3,
    3,attribute_4,
    4,attribute_5,
    5,attribute_6,
    6,attribute_7,
    7,attribute_8,
    8,attribute_9,
    9,attribute_10,
    10,attribute_11,
    11,attribute_12,
    12,attribute_13,
    13,attribute_14,
    14,attribute_15,
    15,attribute_16,
    16,attribute_17,
    17,attribute_18,
    18,attribute_19,
    19,attribute_20,      
    null) val
  INTO lv_val
  FROM    (
           select * from ataf_data
           where test_data_id = p_test_data_id
           ORDER BY dbms_random.value
          )
  WHERE rownum = 1;
  RETURN lv_val;
END random_data;
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
FUNCTION ret_table(p_string VARCHAR2, p_separator VARCHAR2) RETURN ret_val_t
PIPELINED IS
l_vc_arr2 apex_application_global.vc_arr2;
BEGIN
l_vc_arr2 := apex_util.string_to_table(p_string, p_separator);
FOR z IN 1 .. l_vc_arr2.COUNT LOOP
PIPE ROW(l_vc_arr2(z));
END LOOP;
END ret_table;
END "ATAF_PKG";
/