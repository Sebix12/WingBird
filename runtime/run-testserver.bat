@echo off
:: Test Server Runtime for GearBird project
echo GearBird Test/Developer Server Runtime
echo.

:: Read server.conf
for /f "tokens=1,2 delims==" %%a in (server.conf) do (
    if %%a==server set %%a=%%b
    if %%a==server-path set %%a=%%b
    if %%a==bindto set %%a=%%b
    if %%a==port set %%a=%%b
    if %%a==cli-options set %%a=%%b
)

echo Options selected:
echo Server: %server%
echo Server Path: %server-path%
echo Bind Address: %bindto%
echo Port: %port%
echo CLI Options: %cli-options%
echo.

if not exist out\ goto notcompiled
cd out

:: Decide what server to host
if "%server%"=="php-developer" goto hostphp
if "%server%"=="python-http" goto hostpython
goto invalidserver


:: PHP Server Hosting
:hostphp
%server-path% -S %bindto%:%port% %cli-options%
goto serverfinish

:: Python Server Hosting
:hostpython
%server-path% -m http.server -b %bindto% %port%
goto serverfinish


:: If invalid server is selected
echo Server type "%server%" is invalid!
echo Valid options are: "php-developer", "python-http".
echo.
echo Please choose a valid option and try again.
goto EOF


:: Server finished/exited
:serverfinish
echo Server finished/exited
goto EOF

:: Out folder not found
:notcompiled
echo Application not compiled! (out dir not found)
echo Compile your app with "gb compile"
goto EOF

:EOF