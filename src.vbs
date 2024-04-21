On Error Resume Next

  Dim x
  For x = 1 To 10

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



WScript.Sleep(300)

  Next

  set runiiko = WScript.CreateObject("WScript.Shell")
  runiiko.Run """C:\Program Files\iiko\iikoRMS\Front.Net\iikoFront.Net.exe""",1

On Error Goto 0
