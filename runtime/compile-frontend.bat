@echo off
echo GearBird Compiler
echo.

:: Read transpiler config file
for /f "tokens=1,2 delims==" %%a in (runtime\compiler.conf) do (
    if %%a==source-dir set %%a=%%b
)

echo Selected options:
echo Source Directory: %source-dir%
echo.

:: Prep
mkdir out
if exist compilation.temp del compilation.temp

:: Get all files
for /r %%f in (%source-dir%\*.bat) do (
    echo Compiling/Running %%~nxf . . .
    call %source-dir%\%%~nxf
)

for /r "%source-dir%" %%f in (*.*) do (
    :: Get the file extension
    set "ext=%%~xf"
    setlocal enabledelayedexpansion
    if /i "!ext!" NEQ ".bat" (
        echo Copying non-batch file %%~nxf . . .
        copy %source-dir%\%%~nxf out\%%~nxf
    )
    endlocal
)

echo *** BUILD DONE ***