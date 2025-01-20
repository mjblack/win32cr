function returnToRoot {
    Set-Location ..\..
}

if (!(Test-Path .\lib\winmd)) {
    throw "WinMD shard not found"
}

if (!(Test-Path .\lib\winmd\bin\winmd.exe)) {
    Set-Location .\lib\winmd

    # create bin dir under winmc
    if (!(Test-Path .\bin)) {
        mkdir bin
    }

    if (!(Test-Path .\build.ps1)) {
        returnToRoot
        throw "WinMD build script not found in WinMD shard"
    }

    & .\build.ps1

    returnToRoot

    # create the bin dir under win32cr
    if (!(Test-Path .\bin)) {
        mkdir bin
    }
    if (!(Test-Path .\lib\winmd\bin\winmd.exe)) {
        throw "WinMD executable not found"
    }
}
Copy-Item .\lib\winmd\bin\winmd.exe .\bin\winmd.exe