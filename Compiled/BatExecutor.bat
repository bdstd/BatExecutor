@echo off
echo All Parameter = %all_exe_param%>temp.txt
echo Parameter 0   = %exe_param0%>>temp.txt
echo Parameter 1   = %exe_param1%>>temp.txt
echo Parameter 2   = %exe_param2%>>temp.txt
cls
type temp.txt
echo Start Notepad.exe
Notepad.exe temp.txt
del /q temp.txt