@echo off
rem https://github.com/longxk2017/Pcap_DNSProxy_autoupdate
rem Last modified: 2019-1-8 18:05
rem This is the Pcap_DNSProxy directory.
set file=C:\Pcap_DNSProxy\Windows
cd %file%
%file:~0,2%
rem Whether to pause when the program completes.
rem 1 is off. 0 is on.
set task=0
rem Do you want to add Google domain database(google.china.conf)?
rem Y or N.
set addGoogle=Y
rem Do you want to add Apple domain database(apple.china.conf)?
rem Y or N.
set addApple=Y

rem - - - - - - - - - -

echo %addGoogle%> %TEMP%\whiteList0001
echo %addApple%>> %TEMP%\whiteList0001
echo . >> %TEMP%\whiteList0001
if exist Pcap_DNSProxy.exe (goto next) else ( echo  this is a line)
if exist Pcap_DNSProxy_x86.exe (goto next) else ( echo  this is a line)
if exist Pcap_DNSProxy_XP.exe (goto next) else ( echo  this is a line)
goto error_not_found
:next
cd %file%\Tools\Update_WhiteList
call Update_WhiteList.bat < %TEMP%\whiteList0001
move /Y WhiteList.txt %file%
del %TEMP%\whiteList0001
cd %file%
set pService00011=5
set pService00012=8
::echo %pService00011%> %TEMP%\pService0001
::echo %pService00012%>> %TEMP%\pService0001
::call ServiceControl.bat < %TEMP%\pService0001
::del %TEMP%\pService0001
goto success
:error_not_found
echo This is not a directory for Pcap_DNSProxy.
goto exit
:success
echo All Done!!
:exit
if "%task%"=="0" ( pause )
