for /f "tokens=1,* delims= " %%a in ("%*") do set text=%%b
echo ^<a href^="%1"^>%text%^<^/a^> >>..\..\compilation.temp