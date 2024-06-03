@echo off
set component=%cd%\components
set script=%cd%\scripts
cd commands\html

:: Create paragraph
call paragraph Hello World!

:: Call google-link component
call %component%\google-link

:: Run test backend script file
call runscript %script%\test-backend.bat

:EOF
call ..\endfile index.php