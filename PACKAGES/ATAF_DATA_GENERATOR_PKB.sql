CREATE OR REPLACE PACKAGE BODY  "ATAF_DATA_GENERATOR" is
function NI_NUMBER return VARCHAR2
as
  lv_pre VARCHAR2(2);
  lv_suf VARCHAR2(1);
  lv_bi1 varchar2(3);
  lv_bi2 varchar2(3);
  lv_bi3 varchar2(3);
  lv_no  NUMBER;
  lv_ni  VARCHAR2(13);
BEGIN
  WHILE 
    lv_pre IN ('BG','GB','KN','NK','NT','TN','ZZ') 
    OR substr(lv_pre,1,1) IN ('D','F','I','Q','U','V')
    OR substr(lv_pre,2,1) IN ('D','F','I','O','Q','U','V')
    OR lv_pre IS NULL 
  LOOP
    lv_pre := DBMS_RANDOM.STRING('U',2);
  END LOOP;
  lv_no := TRUNC(DBMS_RANDOM.VALUE(1, 5));
  lv_suf:= case lv_no
           when 1 THEN ' '
           when 2 then 'A'
           when 3 then 'B'
           when 4 then 'C'
           when 5 then 'D' END;
  lv_bi1 := TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(0, 99)),'00');
  lv_bi2 := TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(0, 99)),'00');
  lv_bi3 := TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(0, 99)),'00');
  
  lv_ni := lv_pre||lv_bi1||lv_bi2||lv_bi3||' '||lv_suf;
  RETURN lv_ni;
end NI_NUMBER;
function NHS_NUMBER return VARCHAR2
as
  lv_reg NUMBER;
  lv_num VARCHAR2(9);
  lv_chk NUMBER;
  lv_nhs VARCHAR2(100);
BEGIN
  --Choose Wales, Scotland, England or NI
  lv_reg := trunc(DBMS_RANDOM.VALUE(1, 3)); 
  IF lv_reg = 1 THEN
    lv_num := TRIM(TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(400000000, 499999999)),'000000000'));
  ELSIF lv_reg = 2 THEN
    lv_num := TRIM(TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(600000000, 708800001)),'000000000'));
  ELSIF lv_reg = 3 THEN
    lv_num := TRIM(TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(320000001, 399999999)),'000000000'));
  END IF;
  lv_chk :=   
  11-mod((to_number(substr(lv_num,1,1)) * 10)+
        (to_number(substr(lv_num,2,1)) * 9 )+
        (to_number(substr(lv_num,3,1)) * 8 )+
        (to_number(substr(lv_num,4,1)) * 7 )+
        (to_number(substr(lv_num,5,1)) * 6 )+
        (to_number(substr(lv_num,6,1)) * 5 )+
        (to_number(substr(lv_num,7,1)) * 4 )+
        (to_number(substr(lv_num,8,1)) * 3 )+
        (to_number(substr(lv_num,9,1)) * 2 ),11);
  lv_nhs := substr(lv_num,1,3)||'-'||substr(lv_num,3,3)||'-'||substr(lv_num,6,3)||lv_chk;
  RETURN lv_nhs;
end NHS_NUMBER;
--
 --+============================================================================+
 --| Name        :  string_generator                                            |
 --|                                                                            |
 --| Description :  Chooses a random format mask from any csv-separated list and|
 --|                and generates a string based on those specifications        |
 --|                'N' for numbers, 'U' for uppercase letters, 'L' for lower   |
 --|                e.g. 'NNN-ULLL,UUU-NNNL,NUL-UNL' - function chooses one and |
 --|                returns compliant string. Also works with just 1 format mask|
 --|                                                                            |
 --|                                                                            |
 --| Modification History :                                                     |
 --| ----------------------                                                     |
 --|                                                                            |
 --| Author             Date      Version   Remarks                             |
 --| ------------------ --------- --------- ------------------------------------|
 --| J. Shenton         02-Sep-15 1         Initial version                     |
 --+============================================================================+
FUNCTION string_generator (p_csv_formats_i IN VARCHAR2
                         , p_escape_char_i IN VARCHAR2 DEFAULT NULL)
RETURN VARCHAR2
IS
lv_format_count NUMBER;
lv_position_choice NUMBER;
lv_chosen_format VARCHAR2(256);
lv_output_string VARCHAR2 (256);
lv_escape_flag NUMBER DEFAULT 0;
INVALID_ESCAPE_CHAR EXCEPTION;
BEGIN
    IF p_escape_char_i IN ('N','n', 'U', 'u', 'L', 'l', ',') --check for reserved letters being used to escape, a no-no
    OR LENGTH(p_escape_Char_i) > 1
    THEN RAISE INVALID_ESCAPE_CHAR;
    END IF;
    
    --1. Determine if there are multiple formats and select one at random
    --count the commas in the string, add 1, this is the number of formats
    lv_format_count := regexp_count(p_csv_formats_i, ',') + 1;
    
    IF lv_format_count = 1   --if there is only one format, generate the output using the entire input string
    THEN lv_chosen_format := p_csv_formats_i;--generate the string using the input format!
    ELSE      
        lv_position_choice := TRUNC(DBMS_RANDOM.VALUE(1,(lv_format_count + 1))); --select start point between 0 and format_count
        IF lv_position_choice = 1
        THEN lv_chosen_format:=  substr(p_csv_formats_i
                                      , 1
                                      , (instr(p_csv_formats_i,',',1)-1) ); --start at 1st position, go till CHAR before 1st comma
        ELSIF lv_position_choice = lv_format_count --last value in the list
        THEN lv_chosen_format:= substr(p_csv_formats_i
                                     , (instr(p_csv_formats_i,',',-1,1)+1) --start point, one character after the last comma
                                     , (length(p_csv_formats_i) -(instr(p_csv_formats_i,',', - 1))) --whole string length minus the position of last comma
                                       );--start at the last commma+1, run till the end
        ELSE lv_chosen_format:= substr(p_csv_formats_i
                                     , (instr(p_csv_formats_i,',',1, (lv_position_choice - 1)) + 1) --start point, the character after the preceding comma 
                                     , (instr(p_csv_formats_i,',',1, lv_position_choice) - (instr(p_csv_formats_i,',',1, (lv_position_choice-1)))) - 1 --length
                                       );
        END IF;
    END IF;
    --2. With a format mask selected, we can now generate the output
    FOR i IN 1..length(lv_chosen_format)
    LOOP
        IF lv_escape_flag = 0 --no escape flag, but character is the escape character
            AND substr(lv_chosen_format, i, 1) = p_escape_char_i
        THEN lv_escape_flag := 1; --set a flag for the next iteration
             CONTINUE;
        ELSIF lv_escape_flag = 1 
        THEN lv_output_string := lv_output_string || substr(lv_chosen_format, i, 1);
             lv_escape_flag := 0; --pass the escaped char through and move on        
        ELSE
            IF substr(lv_chosen_format, i, 1) IN ('N', 'n')   
                THEN lv_output_string := lv_output_string || To_char(TRUNC(DBMS_RANDOM.value(0,9)));
            ELSIF substr(lv_chosen_format, i, 1) IN ('U', 'u')
                THEN lv_output_string := lv_output_string || DBMS_RANDOM.STRING('U', 1);
            ELSIF substr(lv_chosen_format, i, 1) IN ('L', 'l')
                THEN lv_output_string := lv_output_string || DBMS_RANDOM.STRING('L', 1);
            ELSE lv_output_string := lv_output_string || substr(lv_chosen_format, i, 1);
            END IF;
        END IF;
            
    END LOOP;
     
    
RETURN lv_output_string;
EXCEPTION
WHEN INVALID_ESCAPE_CHAR
THEN RETURN 'AN invalid escape character was used, please use a single character, excluding N,n,U,u,L,l and '',''';
WHEN OTHERS
THEN RAISE;
END string_generator;
 
end "ATAF_DATA_GENERATOR";
/