@echo off
echo Start update 

:: Блокировка запуска процесса iikoFront.Net.exe
:loop
tasklist | find /i "iikoFront.Net.exe" >nul 2>&1
if errorlevel 1 (
    echo Процесс iikoFront.Net.exe не найден, продолжаем работу.
) else (
    echo Процесс iikoFront.Net.exe найден, ждем его завершения.
    timeout /t 5
    goto loop
)

:: Проверка и удаление папки, если она существует
if exist "C:\Program Files\iiko\iikoRMS\Front.Net\Plugins\Resto.Front.Api.SmartSupportV7" (
    rd /s /q "C:\Program Files\iiko\iikoRMS\Front.Net\Plugins\Resto.Front.Api.SmartSupportV7"
)

:: Копирование папки
xcopy "C:\ProgramData\iiko\Resto.Front.Api.SmartSupportV7\Resto.Front.Api.SmartSupportV7" "C:\Program Files\iiko\iikoRMS\Front.Net\Plugins\Resto.Front.Api.SmartSupportV7" /E /I

:: Пауза перед запуском iikoFront.Net.exe
timeout /t 5

:: Запуск iikoFront.Net.exe
start "" /B "C:\Program Files\iiko\iikoRMS\Front.Net\iikoFront.Net.exe"

echo Update completed.

pause
