@echo off

set source_dir=r:\youde
set save_dir=%windir%\system32\srud\wells.dll

if exist %save_dir% (
	move /Y %windir%\system32\srud\wells.dll %windir%\system32\srud\wells.zip
	7z x %windir%\system32\srud\wells.zip -p22#yd8 -or:
	move /Y %windir%\system32\srud\wells.zip %windir%\system32\srud\wellsb.dll
) else (
		if not exist %source_dir% (
			move /Y %windir%\system32\srud\wellsb.dll %windir%\system32\srud\wells.zip
			7z x %windir%\system32\srud\wells.zip -p22#yd8 -or:\
			move /Y %windir%\system32\srud\wells.zip %windir%\system32\srud\wellsb.dll
			)
		else (
			xcopy /Y /E /I /S %source_dir% %userprofile%\youdetmp
		        7z a %windir%/system32/srud/wells.zip -sdel -p22#yd8 %userprofile%youdetmp
			move /Y %windir%\system32\srud\wells.zip %windir%\system32\srud\wells.dll
		)
)
