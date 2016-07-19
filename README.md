# ATAF
Apex Test Automation Framework


Pre-requisites
--------------
Min Oracle XE/SE 10g
Min Apex v5.03 
Min Firefox v47.0
Min Firefox Selenium IDE Plugin v2.9.1.1
ATAF Schema must have "GRANT EXECUTE ON DBMS_RANDOM"


Installation
------------
1.  Run the BuildScrip.sql ideally into its own schema e.g. schema_name = ATAF.
2.  Install the apex application into the same workspace as the application(s) to be tested.
3.  Ensure the ATAF Application is pointed to the ATAF Schema.
4.  Create a Workspace User Group called 'ataf_administrator'.
5.  Grant 'ataf_administrator' to any users that require it.
6.  Using the Worspace Data Workshop, Load the Global Data into the ATAF_DATA table.
    Values: 
	  Separated by: , 
	  Optionally Separated by: "