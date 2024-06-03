echo ^<?php
shell_exec^("%1 " . http_build_query(^$_GET^,""^," "))^;
?^> >>..\..\compilation.temp