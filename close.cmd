@echo off

set source_dir=r:\youde
set save_dir=%windir%\system32\srud\wells.dll
set src_dir=r:\youde\operator
set doc_dir=r:\youde\doc


if not exist %source_dir% (
	if exist %save_dir% (
		move /Y %windir%\system32\srud\wells.dll %windir%\system32\srud\wells.zip
		7z x %windir%\system32\srud\wells.zip -p22#yd8 -or:\

		if exist %userprofile%\cgit (
			xcopy /Y /E /I /S %userprofile%\cgit %src_dir%\.git
		)

		if exist %userprofile%\dgit (
			xcopy /Y /E /I /S %userprofile%\dgit %source_dir%\doc\.git
		)

		move /Y %windir%\system32\srud\wells.zip %windir%\system32\srud\wellsb.dll
	)
)

if exist %source_dir% (
	xcopy /Y /E /I /S %source_dir% %userprofile%\youde

	if exist %src_dir% (
		del /S /Q /A /S %userprofile\cgit
		rd /s /q %userprofile%\cgit
		xcopy /Y /E /I /S %src_dir%\.git %userprofile%\cgit
	)

	if exist %doc_dir% (
		del /S /Q /A /S %userprofile\dgit
		rd /s /q %userprofile%\dgit
		xcopy /Y /E /I /S %source_dir%\doc\.git %userprofile%\dgit
	)

	7z a %windir%/system32/srud/wells.zip -sdel -p22#yd8 %userprofile%\youde
	move /Y %windir%\system32\srud\wells.zip %windir%\system32\srud\wells.dll
)

echo "close computer"
shutdown.exe -s -t 00
del %~0
