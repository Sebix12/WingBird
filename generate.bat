:: GearBird Project Generator
:: Written by: cablesalty

@echo off
set /p projectname=Project Name: 
if exist %projectname%\ goto alreadyexists
set /p author=Author: 
echo.
echo Creating directory...

mkdir %projectname%
cd %projectname%

echo Running layout generator...
defaults\layout.bat


:alreadyexists
echo That project/directory already exists.
goto EOF


:EOF