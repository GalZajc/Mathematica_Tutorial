@echo off
cls

if ""=="%1" goto naprej_brez_CD

cd %1
if not %errorlevel% == 0 echo.&echo.&echo napaka (ime mape?) - izhod &goto end

:naprej_brez_CD

for %%I in (.) do set CurrDirName=%%~nxI &set CurrUNC_Name=%%~ndpI

echo.
echo.
echo.
echo Ustvarjam:
echo.
echo "%CurrDirName%.mp4"
echo.
echo iz slik v mapi "%CurrUNC_Name%"
echo.
echo.
echo.

ffmpeg -r 60 -s 7680x4320 -i %%08d.png  -vf scale=7680:4320 "%CurrDirName%-60-7680x4320.mp4"
ffplay "%CurrDirName%-60-7680x4320.mp4"
:end
