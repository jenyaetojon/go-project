Set objFSO = CreateObject("Scripting.FileSystemObject")

' Укажите путь к папке, которую нужно удалить
path = "C:\ProgramData\iiko\SmartSupport\Task"

Dim lngI, objArgs
strComputer = "."
Set objArgs= WScript.Arguments 'Создаём объект WshArguments
'strProcName="-"  
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set colProcesses = objWMIService.ExecQuery _
("Select * from Win32_Process Where Name ='iikoFront.Net.exe'")
If colProcesses.Count = 0 Then

x = 11

Else

Dim oShell : Set oShell = CreateObject("WScript.Shell")
oShell.Run "taskkill /im iikoFront.Net.exe", 1, True
End If

WScript.Sleep(5000)

  set runiiko = WScript.CreateObject("WScript.Shell")
  runiiko.Run """C:\Program Files\iiko\iikoRMS\Front.Net\iikoFront.Net.exe""",1




' Проверьте, существует ли папка
If objFSO.FolderExists(path) Then
    ' Удалите папку и все ее содержимое
    objFSO.DeleteFolder path, True
    WScript.Echo "Folder " & path & " del del."
'    MsgBox "#  SmartSupport  #  UPDATE OK  "
Else
    WScript.Echo "Folder " & path & "  del."
End If
