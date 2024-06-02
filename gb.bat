@echo off
:: GearBird Command Line Utility
:: Built by: cablesalty

set cmd=%1

if "%cmd%"=="version" goto displayversion
if "%cmd%"=="run-dev" goto rundev
if "%cmd%"=="compile" goto compile
goto invalidcommand


:displayversion
echo v1.0
goto EOF

:compile
echo Compiling main entry file...
echo.
cd runtime
compile-frontend.bat
goto EOF

:rundev
echo Compiling main entry file...
echo.
cd runtime
compile-frontend.bat
echo.
echo Running dev server...
goto EOF


:invalidcommand
echo Invalid command entered.
goto EOF

:EOF