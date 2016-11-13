param($build = 0)

#Constants
$seleniumKey = "3CA148C6E6472DC5E053F2EE0D55870C"
$devServer = "https://apex1uk.revion.com/pls/apex/"
$ciServer = "http://localhost:8888/apex/"
#Fastest
$browserAgent = "*firefox C:\Program Files (x86)\Mozilla Firefox\firefox.exe"
#$browserAgent = "*iexplore"
#Use FF Crome Agent
#$browserAgent = "*chrome"
#$browserAgent = "*googlechrome C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
$appId = "108"
$projectId = "9714"

#Cleardown the folders
del C:\Selenium\Results\*.*
del C:\Selenium\Scripts\*.*

#Set JSON object from web service
$specObject = Invoke-WebRequest -Uri http://ords.apex1uk.revion.com/ords/shunt/selenium.suite.json/$appId -UseBasicParsing | ConvertFrom-Json
$resObject = Invoke-WebRequest -Uri http://ords.apex1uk.revion.com/ords/shunt/selenium.junit.create/$build -UseBasicParsing | ConvertFrom-json
$resultId = $resObject.result_id


#Loop through specifications
foreach($obj1 in $specObject.items)
{
 #Set variables
 $testSpecId = $obj1.test_spec_id

 $specFileName = "C:\Selenium\Scripts\Spec_" + $obj1.test_spec_id + ".htm"
 $resultFileName = "C:\Selenium\Results\ATAF_Result_" + $obj1.test_spec_id + ".htm"

 #Download the html suite containing a single specification
 $theSpecURL = "https://apex1uk.revion.com/pls/apex/f?p=108:10:::NO:10:PROJECT_ID,TEST_SPEC_ID,SELENIUM_KEY:" + $projectId + "," + $testSpecId + "," + $seleniumKey

 $caseObject = Invoke-WebRequest -Uri http://ords.apex1uk.revion.com/ords/shunt/selenium.case.json/$testSpecId -UseBasicParsing | ConvertFrom-Json

   #Loop through cases
   foreach($obj2 in $caseObject.items)
   {
     $specCaseId = $obj2.spec_case_id
     $caseFileName = "C:\Selenium\Scripts\" + $obj2.test_case + ".htm"
     
     #Download the html Case file containing all the cases in the single specification  
     $theCaseURL = "https://apex1uk.revion.com/pls/apex/f?p=108:9:::NO:9:PROJECT_ID,TEST_SPEC_ID,SPEC_CASE_ID,DOMAIN,SELENIUM_KEY:"+ $projectId +","+ $testSpecId +","+ $specCaseId +",dev.westminster.mod.uk," + $seleniumKey

     wget $theCaseURL -OutFile $caseFileName
 
   }

 wget $theSpecURL -OutFile $specFileName
 java -jar C:\Selenium\Server\selenium-server-standalone-2.53.1.jar -htmlSuite $browserAgent $ciServer $specFileName $resultFileName

}

################################
#### CREATE RESULTS LOAD SPEC ##
################################

$specFileName = "C:\Selenium\Scripts\Spec_Upload_Results.htm"
$resultFileName = "C:\Selenium\Results\Spec_Upload_Results.htm"
$theSpecURL = "https://apex1uk.revion.com/pls/apex/f?p=108:10:::NO:10:TEST_SPEC_ID,PROJECT_ID,SELENIUM_KEY:0," + $projectId + "," + $seleniumKey

wget $theSpecURL -OutFile $specFileName
 java -jar C:\Selenium\Server\selenium-server-standalone-2.53.1.jar -htmlSuite $browserAgent $devServer $specFileName $resultFileName

############################
#### CREATE JUNIT RESULTS ##
############################

$XmlFileName = "C:\Selenium\Results\ataf_result.xml"
$resultURL = "http://ords.apex1uk.revion.com/ords/shunt/seleinium.junit.report/" + $resultId

wget $resultURL -OutFile $XmlFileName