@echo off

chcp 65001
set source_dir=r:\youde
set save_dir=%windir%\system32\srud\wells.dll
set src_dir=r:\youde\c-system
set doc_dir=r:\youde\doc


if not exist %source_dir% (
	if exist %save_dir% (
		move /Y %windir%\system32\srud\wells.dll %windir%\system32\srud\wells.zip
		7z x %windir%\system32\srud\wells.zip -p22#yd8 -or:\

		if exist %userprofile%\cgit (
			xcopy /Y /E /I /S %userprofile%\cgit %source_dir%\c-system\.git
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
		xcopy /Y /E /I /S %source_dir%\c-system\.git %userprofile%\cgit
	)

	if exist %doc_dir% (
		xcopy /Y /E /I /S %source_dir%\doc\.git %userprofile%\dgit
	)

	7z a %windir%/system32/srud/wells.zip -sdel -p22#yd8 %userprofile%\youde
	move /Y %windir%\system32\srud\wells.zip %windir%\system32\srud\wells.dll
)


if not exist %userprofile%\Desktop\快速关机.cmd (
	if exist %source_dir%\close.cmd (
		copy %source_dir%\close.cmd %userprofile%\Desktop\快速关机.cmd
	)
)

exit
