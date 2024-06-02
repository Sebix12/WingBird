@echo off
cd commands\html

call paragraph Hello World!
call link https:^/^/google.com Search the Web

call ..\endfile index.html
:EOF