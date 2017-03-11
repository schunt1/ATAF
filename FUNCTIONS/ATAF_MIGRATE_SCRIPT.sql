CREATE OR REPLACE FUNCTION ataf_migrate_script (p_id IN NUMBER) 

RETURN NUMBER AS

  lv_id ataf_temp_mv.id%TYPE;
  lv_page_id  ataf_temp_mv.page_id%TYPE; 
  lv_name  ataf_temp_mv.name%TYPE; 
  lv_type  ataf_temp_mv.type%TYPE;
  lv_label  ataf_temp_mv.label%TYPE;
  lv_application_id  ataf_temp_mv.application_id%TYPE;

BEGIN

  SELECT page_id, name, type, application_id, label 
  INTO lv_page_id, lv_name, lv_type, lv_application_id, lv_label
  FROM ataf_temp_mv
  WHERE id = p_id;  

  SELECT id 
  INTO lv_id
  FROM ataf_apex_page_items_v
  WHERE page_id = lv_page_id
  AND name = lv_name
  AND type = lv_type
  AND label = lv_label
  AND application_id = lv_application_id;

  RETURN lv_id;

END;