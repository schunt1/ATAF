# ATAF
Apex Test Automation Framework


Pre-requisites
--------------
Min Oracle XE/SE 10g
Min Apex v5.03 
Min Firefox v47.0
Min Firefox Selenium IDE Plugin v2.9.1.1


Installation
------------
1.  Create a new Apex Worksace
    (EG workspace_name = ATAF
        Schema         = ATAF
        Size           = 10Mb)
2.  Run BuildScrip.sql
    Note.  If running on apex.oracle.com, comment out the line 
           "APEX_UTIL.CREATE_USER_GROUP(p_group_name => 'ataf_administrator');"
           and create this step manually using the user manager.
3.  Install Apex Application
