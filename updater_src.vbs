Dim oShell
Set oShell = WScript.CreateObject("WScript.Shell")

' Выполнение команды taskkill для закрытия процесса iikoFront.Net.exe
oShell.Run "taskkill /im iikoFront.Net.exe /f", 0, True

Set oShell = Nothing
