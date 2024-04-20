Set objFSO = CreateObject("Scripting.FileSystemObject")

' Укажите путь к папке, которую нужно удалить
path = "C:\ProgramData\iiko\SmartSupport\Task"

' Проверьте, существует ли папка
If objFSO.FolderExists(path) Then
    ' Удалите папку и все ее содержимое
    objFSO.DeleteFolder path, True
    WScript.Echo "Folder " & path & " del del."
'    MsgBox "#  SmartSupport  #  UPDATE OK  "
Else
    WScript.Echo "Folder " & path & "  del."
End If
