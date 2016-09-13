CREATE OR REPLACE PACKAGE  "ATAF_DATA_GENERATOR" as
function ni_number 
    return varchar2;
function nhs_number
    return varchar2;   
--
 --+============================================================================+
 --| Name        :  string_generator                                            |
 --|                                                                            |
 --| Description :  Chooses a random format mask from any csv-separated list and|
 --|                and generates a string based on those specifications        |
 --|                'N' for numbers, 'U' for uppercase letters, 'L' for lower   |
 --|                e.g. 'NNN-ULLL,UUU-NNNL,NUL-UNL' - function chooses one and |
 --|                returns compliant string. Also works with just 1 format mask|
 --|                Second parameter is the user-definable escape character     |
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
RETURN VARCHAR2;    
end;
/