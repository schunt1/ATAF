echo off
set apexPwd=%1

java -jar "C:/Program Files/apexsec-win64.jar" --host localhost --sid xe --port 1521 --user apex_050100 --pass %apexPwd% --savepassword --appid 242 --junit c:\Users\shunt\ApexSec\ATAF.apexsec