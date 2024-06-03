@echo off
set component=%cd%\components
set scripts=%cd%\scripts
cd commands\html

:: Create paragraph
call paragraph Hello World!

:: Call google-link component
call %component%\google-link

:: Run test backend script file

:EOF
call ..\endfile index.html