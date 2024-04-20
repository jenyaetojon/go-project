Set objFSO = CreateObject("Scripting.FileSystemObject")

' Укажите путь к папке, которую нужно удалить
path = "C:\ProgramData\iiko\SmartSupport\Task"

' Проверьте, существует ли папка
If objFSO.FolderExists(path) Then
    ' Удалите папку и все ее содержимое
    objFSO.DeleteFolder path, True
    WScript.Echo "Папка " & path & " успешно удалена."
    MsgBox "#  Start  Update  #  Test UPDATeeeeed "
Else
    WScript.Echo "Папка " & path & " не существует."
End If
