@echo off
echo ^<?php >>..\..\compilation.temp
echo $params = $_GET; >>..\..\compilation.temp
echo $query_string = http_build_query($params, '', ' '); >>..\..\compilation.temp
echo $escaped_query_string = escapeshellarg($query_string); >>..\..\compilation.temp
echo $batch_file = str_replace('\\\\', '/', '%*'); >>..\..\compilation.temp
echo $escaped_batch_file = escapeshellcmd($batch_file); >>..\..\compilation.temp
echo $command = "cmd /c call $escaped_batch_file $escaped_query_string"; >>..\..\compilation.temp
echo $output = shell_exec($command); >>..\..\compilation.temp
echo echo $output; >>..\..\compilation.temp
echo ?^> >>..\..\compilation.temp
