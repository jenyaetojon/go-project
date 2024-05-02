Option Explicit

' Путь к папке, которую нужно проверить
Dim checkPath As String
checkPath = "C:\Program Files\iiko\iikoRMS\Front.Net\Plugins\Resto.Front.Api.SmartSupportV7"

' Создаем объект FileSystemObject
Dim objFSO As Object
On Error Resume Next
Set objFSO = CreateObject("Scripting.FileSystemObject")
If Err.Number <> 0 Then
    WScript.Echo "Ошибка при создании объекта FileSystemObject: " & Err.Description
    Exit Script
End If
On Error GoTo 0

' Создаем объект WScript.Shell для работы с процессами
Dim oShell As Object
On Error Resume Next
Set oShell = CreateObject("WScript.Shell")
If Err.Number <> 0 Then
    WScript.Echo "Ошибка при создании объекта WScript.Shell: " & Err.Description
    Exit Script
End If
On Error GoTo 0

' Создаем объект для работы с WMI
Dim objWMIService As Object
Dim colProcesses As Object
Dim strComputer As String
strComputer = "."

On Error Resume Next
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
If Err.Number <> 0 Then
    WScript.Echo "Ошибка при создании объекта WMI: " & Err.Description
    Exit Script
End If
On Error GoTo 0

' Цикл проверки и закрытия процесса
Do While Not objFSO.FolderExists(checkPath)
    ' Проверяем, запущен ли процесс iikoFront.Net.exe
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name ='iikoFront.Net.exe'")
    
    If colProcesses.Count > 0 Then
        ' Если процесс запущен, пытаемся его закрыть
        oShell.Run "taskkill /im iikoFront.Net.exe", 1, True
        ' Ждем 5 секунд перед следующей проверкой
        WScript.Sleep(5000)
    Else
        ' Если процесса нет, просто ждем 5 секунд перед следующей проверкой
        WScript.Sleep(5000)
    End If
Loop

' Проверяем, существует ли папка
If objFSO.FolderExists(checkPath) Then
    WScript.Echo "Папка " & checkPath & " существует."
Else
    WScript.Echo "Папка " & checkPath & " не существует."
End If

' Закрытие объектов
Set objFSO = Nothing
Set oShell = Nothing
Set objWMIService = Nothing
