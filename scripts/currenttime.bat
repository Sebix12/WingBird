@echo off
:: This is a script. If linked to a source file,
:: it runs every time the user accesses that file
:: like PHP (kinda).

:: Get every url query ($_GET in PHP)
set get=%*

:: For this example, we echo back the current time
echo %time%