@echo off

echo Generating source folder...
mkdir src
cd src
echo Creating example file...
echo @echo off >index.bat
echo set purpouse=html >>index.bat
echo template doctype >>index.bat
echo. >>index.bat
echo paragraph Hello, World! >>index.bat
echo. >>index.bat
echo :EOF >>index.bat
cd ..