@echo off
set component=%cd%\components
set script=%cd%\scripts
cd commands\html

call doctypehtml


:: Create paragraph
call paragraph Hello World!

:: Call google-link component
call %component%\google-link

:: Run test backend script file
call runscript %script%\test-backend.bat


call endhtml

:EOF
call ..\endfile index.php