@echo off
if not exist %windir%\system32\RUforIT.dll goto:notexist
echo To uninstall, you must run this command with administrative privilegies.
set /p answer="Do you want to uninstall RUforIT.dll from your system? [Y/N] "
if "%answer%"=="" goto:no
if "%answer:~0,1%"=="y" goto:yes
:no
echo Cancelled.
goto:eof
:yes
del %windir%\system32\RUforIT.dll >nul 2>&1
if exist %windir%\system32\RUforIT.dll goto:cannotdel
set key="HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\07430420"
reg delete %key% /f >nul 2>&1
if errorlevel 1 goto:cannotreg
if errorlevel 1 goto:cannotreg
echo The job is done.
goto:eof
:notexist
echo There is no RUforIT.dll installed.
goto:eof
:cannotdel
echo Error: unable to delete file from system directory.
echo Make sure you are running this command with administrative privilegies.
goto:eof
:cannotreg
echo Error: unable to unregister the layout.
goto:eof