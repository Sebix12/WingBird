@echo off
echo GearBird Compiler
echo.

cd ..

:: Read transpiler config file
for /f "tokens=1,2 delims==" %%a in (runtime\compiler.conf) do (
    if %%a==enable-php set %%a=%%b
    if %%a==source-dir set %%a=%%b
)

echo Selected options:
echo Enable PHP: %enable-php%
echo Source Directory: %source-dir%
echo.

:: Get all files
for /r %%f in (%source-dir%\*.bat) do (
    echo Compiling/Running %%~nxf . . .
    %source-dir%\%%~nxf
)

echo *** COMPILATION DONE ***