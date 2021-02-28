@echo off
set browser_path="C:\Program Files\Mozilla Firefox\"
set browser_exe=Firefox.exe
cd /d %browser_path%
if defined exe_param2 (
	start %browser_exe% %exe_param2%
) else (
	start %browser_exe%
)