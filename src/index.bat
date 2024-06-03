@echo off
set component=%cd%\components
set script=%cd%\scripts
cd commands\html

:: This creates a <!DOCTYPE html> tag
call doctypehtml

:: <head> part of document
call head

:: Add style.css to this file
call linkcss style.css

call endhead

:: Body part of document
call body

call title It works!
call subtitle Check out the useful links below to learn more!

:: Link the "links" component to this file
call %component%\links

call linebreak

:: Run the "currenttime" script.
:: This will run every time the user accesses this file.
call runscript %script%\currenttime

call endbody

call endhtml

:EOF
call ..\endfile index.php