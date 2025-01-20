Set-Location .\lib\winmd
mkdir bin
& .\build.ps1
Set-Location ..\..
mkdir bin
Copy-Item .\lib\winmd\bin\winmd.exe .\bin\winmd.exe