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

ffmpeg -r 60 -s 1280x720 -i %%08d.png  -vf scale=1280:720 "%CurrDirName%-60-1280x720.mp4"
ffplay "%CurrDirName%-60-1280x720.mp4"
:end
