@echo off
set component=%cd%\components
cd commands\html

call paragraph Hello World!

:: Call google-link.bat in the source dir
call %component%\google-link

:EOF
call ..\endfile index.html