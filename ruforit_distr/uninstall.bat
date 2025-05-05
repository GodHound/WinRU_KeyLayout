@echo off
if not exist %windir%\system32\RUforIT.dll goto:notexist
echo To uninstall, you must run this command with administrative privilegies.
set /p answer="Do you want to uninstall RUforIT.dll from your system? [Y/N] "
if "%answer%"=="" goto:no
if "%answer:~0,1%"=="y" goto:yes
:no
echo Cancelled.
goto:wait
:yes
del %windir%\system32\RUforIT.dll >nul 2>&1
if exist %windir%\system32\RUforIT.dll goto:cannotdel
del %windir%\SysWOW64\RUforIT.dll >nul 2>&1
if exist %windir%\SysWOW64\RUforIT.dll goto:cannotdel
set key="HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\07430420"
reg delete %key% /f >nul 2>&1
if errorlevel 1 goto:cannotreg
echo The job is done.
goto:wait
:notexist
echo There is no RUforIT.dll installed.
goto:wait
:cannotdel
echo Error: unable to delete file from system directory.
echo Make sure you are running this command with administrative privilegies.
goto:wait
:cannotreg
echo Error: unable to unregister the layout.
goto:wait
:wait
TIMEOUT 5