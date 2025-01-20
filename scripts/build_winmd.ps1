Set-Location .\lib\winmd
& .\build.ps1
Set-Location ..\..
Copy-Item .\lib\winmd\bin\winmd.exe .\bin\winmd.exe