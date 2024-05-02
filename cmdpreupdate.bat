@echo off
echo Start update

:: Запуск iikoFront.Net.exe
start "" /B "C:\Program Files\iiko\iikoRMS\Front.Net\iikoFront.Net.exe"

:: Блокировка запуска процесса iikoFront.Net.exe
:loop
tasklist | find /i "iikoFront.Net.exe" >nul 2>&1
if errorlevel 1 (
    echo  iikoFront.Net.exe not found, work.
) else (
    echo  iikoFront.Net.exe found, continue.
    timeout /t 1
    goto loop
)

:: Проверка и удаление папки, если она существует
if exist "C:\Program Files\iiko\iikoRMS\Front.Net\Plugins\Resto.Front.Api.SmartSupportV7" (
    rd /s /q "C:\Program Files\iiko\iikoRMS\Front.Net\Plugins\Resto.Front.Api.SmartSupportV7"
)


:: Копирование папки
xcopy "C:\ProgramData\iiko\SmartSupport\Resto.Front.Api.SmartSupportV7\Resto.Front.Api.SmartSupportV7" "C:\Program Files\iiko\iikoRMS\Front.Net\Plugins\Resto.Front.Api.SmartSupportV7" /E /I


:: Проверка и удаление файла, если он существует
if exist "C:\ProgramData\iiko\SmartSupport\Resto.Front.Api.SmartSupportV7.zip" (
    del /f /q "C:\ProgramData\iiko\SmartSupport\Resto.Front.Api.SmartSupportV7.zip"
)

:: Проверка и удаление папки, если она существует
if exist "C:\ProgramData\iiko\SmartSupport\Resto.Front.Api.SmartSupportV7" (
    rd /s /q "C:\ProgramData\iiko\SmartSupport\Resto.Front.Api.SmartSupportV7"
)



echo Update completed.

exit
