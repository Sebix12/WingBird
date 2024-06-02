@echo off
cd commands\html
set component=..\..\components

call paragraph Hello World!

:: Call google-link.bat in the source dir
call %component%\google-link

:EOF
call ..\endfile index.html