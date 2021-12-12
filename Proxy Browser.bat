:: Made for educational purposes

:: This is the Chrome version of the browser. It will use Google Chrome even if its not your default browser.

@echo off

@REM Adds colours
@REM I DID NOT COME UP WITH THIS COLOUR THING
@REM A friend found this somewhere and showed it to me.idk who made it. Big thanks to whoever did :)
Set _fBlack=[30m
Set _bBlack=[40m
Set _fRed=[31m
Set _bRed=[41m
Set _fGreen=[32m
Set _bGreen=[42m
Set _fYellow=[33m
Set _bYellow=[43m
Set _fBlue=[34m
Set _bBlue=[44m
Set _fMag=[35m
Set _bMag=[45m
Set _fCyan=[36m
Set _bCyan=[46m
Set _fLGray=[37m
Set _bLGray=[47m
Set _fDGray=[90m
Set _bDGray=[100m
Set _fBRed=[91m
Set _bBRed=[101m
Set _fBGreen=[92m
Set _bBGreen=[102m
Set _fBYellow=[93m
Set _bBYellow=[103m
Set _fBBlue=[94m
Set _bBBlue=[104m
Set _fBMag=[95m
Set _bBMag=[105m
Set _fBCyan=[96m
Set _bBCyan=[106m
Set _fBWhite=[97m
Set _bBWhite=[107m
Set _RESET=[0m



@REM Checks if you have chrome.
if not exist "C:\Program Files\Google\Chrome\Application\chrome.exe" (
	title Chrome.exe not found...
	color 4
	echo /////////////////////////////////////////////////////////
	echo /                  Chrome not found...                  /
	echo /   Please make sure you have google chrome installed   /
	echo /////////////////////////////////////////////////////////
	echo 
	echo Closing in 5 seconds...
	timeout /t 5 /nobreak>nul
	exit
)



@REM Starting screen
:start
cls
title Miniproxy Browser
color 7
echo %_fGreen%%_bBlack%///////////////
echo /   WELCOME   /
echo ///////////////
echo.
echo %_fBlue%%_bBlack%This is a program that allows you to access any blocked site.
echo Some websites may not work properly.
echo.
echo %_fRed%%_bBlack%This program is made for educational purposes only
echo and I am not responsible for any malicious acts or uses
echo that people may use this for.%_RESET%
echo.
echo %_fBlue%Star on Github!%_RESET%
echo %_bGreen%%_fBWhite%https://github.com/ImmortalTerror/Mini-Proxy-browser%_RESET%
echo.
echo.
echo %_fGreen%%_bBlack%///////////////
echo /   UPDATES   /
echo ///////////////
echo.
echo %_fGreen%%_bBlack%12/12/21
echo %_fBlue%%_bBlack%-Added many cool colours everywhere
echo -Fancy menu's using cmdmenusel (very cool!)
echo -All sorts of internal reworks and changes
echo -Added to github
echo.
echo %_fGreen%%_bBlack%Some time ago
echo %_fBlue%%_bBlack%-Now it will search with chrome even if its not your default browser
echo -Added preset option
echo -Other minor internal changes%_RESET%
pause>nul
color 7



@REM Some sexy variables to stop brain from hurting
set "google=https://www.google.com/search?q="
set "proxy=https://ersupport.com/plugins/QuickWebProxy/miniProxy.php?"
set chrome="C:\Program Files\Google\Chrome\Application\chrome.exe"
set "status=enabled"



@REM The bit where you choose your shit
:main
title Miniproxy Browser
cls
echo Would you like to %_bGreen%%_fBlack%search with google%_RESET%, %_fBlack%%_bYellow%enter a url%_RESET% or goto a %_fBlack%%_bBWhite%preset site%_RESET%?
echo.
bin\cmdmenusel.exe f870 "Search" "Url" "Presets" "Exit"
if %ERRORLEVEL% NEQ 4 goto %ERRORLEVEL%
exit



@REM Option to search
:1
cls
title Miniproxy Browser ^|^| Search ^|^| Proxy %status%
echo Type %_fBlack%%_bBWhite%/prox%_RESET% to enable or disable the proxy
echo Type %_fBlack%%_bBWhite%/back%_RESET% to go back
echo.

set /p search=Search: 
if "%search%"=="/back" (
	set search=""
	goto :main
	)

if "%search%"=="/prox" (
	if %status%==disabled (
		set status=enabled
		set search=
		cls
		title Miniproxy Browser ^|^| Search ^|^| Proxy enabled
		echo proxy %_bGreen%enabled%_RESET%
		timeout /t 2 >nul
		goto :1
		)

	if %status%==enabled (
		set status=disabled
		set search=
		cls
		title Miniproxy Browser ^|^| Search ^|^| Proxy disabled
		echo proxy %_bRed%disabled%_RESET%
		timeout /t 2 >nul
		goto :1
		)
)
set search="%search: =+%"
if %status%==enabled (
	cls
	echo searched %_bBWhite%%_fBlack%%search:+= %%_RESET%
	%chrome% %proxy%%google%%search%
	) else (
	cls
	echo searched %_bBWhite%%_fBlack%%search:+= %%_RESET%
	%chrome% %google%%search%

	)
set search=
goto :1



@REM Option to enter a url
:2
cls
title Miniproxy Browser ^|^| URL ^|^| Proxy %status%
echo Type %_fBlack%%_bBWhite%/prox%_RESET% to enable or disable the proxy
echo Type %_fBlack%%_bBWhite%/back%_RESET% to go back
set /p URL=Enter a url: 
if "%URL%"=="/back" (
	set URL=
	goto :main
	)

if "%URL%"=="/prox" (
	if %status%==disabled (
		set status=enabled
		set search=
		cls
		title Miniproxy Browser ^|^| URL ^|^| Proxy enabled
		echo proxy %_bGreen%enabled%_RESET%
		timeout /t 2 >nul
		goto :2
		)

	if %status%==enabled (
		set status=disabled
		set search=
		cls
		title Miniproxy Browser ^|^| URL ^|^| Proxy disabled
		echo proxy %_bRed%disabled%_RESET%
		timeout /t 2 >nul
		goto :2
		)
)

if "%status%"=="enabled" (
	%chrome% %proxy%%URL%
	) ELSE (
	%chrome% %URL%
	)

cls
echo Proxied %_bBWhite%%_fBlack%"%URL%"%_RESET%
set URL=
timeout /t 3 >nul
goto :2



@REM Preset sites to choose from
:3
cls
title Miniproxy Browser ^|^| Presets
echo Choose what site you want to access
echo.
bin\cmdmenusel.exe f870 "AGFY - Free games" "Itch - Free games" "Sourceforge - Free and open source software" "Go back"

if "%ERRORLEVEL%"=="1" (
	cls
	echo Accessing %_bBWhite%%_fBlack%AGFY%_RESET%
	%chrome% https://ersupport.com/plugins/QuickWebProxy/miniProxy.php?https://agfy.co/games-list/
	timeout -t 3 >nul
	goto :3
) ELSE if "%ERRORLEVEL%"=="2" (
	cls
	echo Accessing %_bBWhite%%_fBlack%Itch%_RESET%
	%chrome% https://ersupport.com/plugins/QuickWebProxy/miniProxy.php?https://itch.io/
	timeout -t 3 >nul
	goto :3
) ELSE if "%ERRORLEVEL%"=="3" (
	cls
	echo Accessing %_bBWhite%%_fBlack%SourceForge%_RESET%
	%chrome% https://ersupport.com/plugins/QuickWebProxy/miniProxy.php?https://sourceforge.net/
	timeout -t 3 >nul
	goto :3
) ELSE if "%ERRORLEVEL%"=="4" (
	goto :main
)