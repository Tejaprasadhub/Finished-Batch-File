@echo off

echo.>>H:\logfile-%date%.log

echo ###############((Task Started at %date%-%time%))####################>>H:\logfile-%date%.log

echo path: H:\logfile.log>>H:\logfile-%date%.log

set /A "COUNT=0"
for /F "delims=" %%F in ('
    forfiles /S /P "F:\Angular Projects" /M * /D -0 /C "cmd /C if @isdir==FALSE echo @path"
') do set /A "COUNT+=1"
echo %COUNT%

echo Files Found:%COUNT%>>H:\logfile-%date%.log

set /A "DELCOUNT=0"
for /F "delims=" %%F in ('
    forfiles /S /P "F:\Angular Projects"  /D -0 /C "cmd /C if @isdir==FALSE del /q @path"
') do  set /A "DELCOUNT+=1"
echo %DELCOUNT%


set /A "REMCOUNT=0"
for /F "delims=" %%F in ('
    forfiles /S /P "F:\Angular Projects" /M * /D -0 /C "cmd /C if @isdir==FALSE echo @path"
') do set /A "REMCOUNT+=1"
echo %REMCOUNT%



Rem echo Remaining Files Found:%REMCOUNT%>>H:\logfile-%date%.log

 set /a "DeleteCount=%COUNT%-%REMCOUNT%"
  echo After Subtraction DeleteCount is %DeleteCount%

echo Files Deleted:%DeleteCount%>>H:\logfile-%date%.log




echo ###############((Task Ended at %date%-%time%))####################>>H:\logfile-%date%.log

pause