@echo off
echo GearBird Compiler
echo.

:: Read transpiler config file
for /f "tokens=1,2 delims==" %%a in (compiler.conf) do (
    if %%a==enable-php set %%a=%%b
    if %%a==source-dir set %%a=%%b
)

echo Selected options:
echo Enable PHP: %enable-php%
echo Enable PHP: %source-dir%
echo.

:: CD to source dir
cd %source-dir%

:: Get all files
for /r %%f in (*.bat) do (
    echo Compiling/Running %%f . . .
    %%f
)

echo *** COMPILATION DONE ***