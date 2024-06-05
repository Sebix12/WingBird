@echo off
:: GearBird Command Line Utility - CLI Runner
:: Built by: sebix12; for cablesalty's WingBird

::cvars
set cli.config.n=cli.conf
goto :cli.emulate
::end

::prep
:cli.prep
if exist %cli.config.n% call %config%
if exist %cli.config.n% goto :emulate
if not exist %cli.config.n% goto :cli.conf.create
goto :end

::errorlogging
:cli.errorlogging

goto :emulate


::emulation
:cli.emulate
set /p cli.input=">"
goto :cli.run

::script running
:cli.run
if "%cli.input%" == "cli conf create" goto :cli.conf.create
if "%cli.input%" == "cli conf delete" goto :cli.conf.delete
if "%cli.input%" == "cli conf reload" goto :cli.conf.input
if "%cli.input%" == "help" goto :cli.help
call wb.bat %cli.input%
goto :cli.emulate

::other
:cli.conf.create
echo set defloc=%~dp0 > %cli.config.n%
echo set  >> %cli.config.n%

:emulate
goto :cli.emulate


:cli.conf.delete
if not exist %cli.config.n% echo no config exists
if not exist %cli.config.n% echo no config exists

if exist %cli.config.n% del /q %cli.config.n%
goto :emulate

:cli.conf.input

::built in commands
:cli.help
type help.dll
echo.
goto :cli.emulate

:end
pause