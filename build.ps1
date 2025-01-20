$WINMD_PARAMS = ""

function DownloadJSON {
    mkdir json
    git clone -v --depth 1 https://github.com/marlersoft/win32json .\json\win32json
}

function CleanUpJSON {
    Remove-Item -Path json -Force -Recurse
}

function PrepJSON {
    if ($env:JSON_CACHE) {
        if (!(Test-Path -Path .\json\win32json)) { DownloadJSON }
    } else {
        if (Test-Path -Path .\json\win32json) { CleanUpJSON }
        DownloadJSON
    }
}
function PrepSrcDir {
    if (Test-Path -Path .\src\win32cr.cr) { Remove-Item -Path src/win32cr.cr }
    if (Test-Path -Path .\src\win32cr) { Remove-Item -Path src/win32cr -Force -Recurse }
}

function CleanUp {
    if (!($env:JSON_CACHE)) {
        CleanUpJSON
    }
}

function Run {
    if ($env:WINMD_DEBUG) {
        $WINMD_PARAMS = $WINMD_PARAMS + "-d"
    }

    if ($env:WINMD_TRACE) {
        $WINMD_PARAMS = $WINMD_PARAMS + " -t"
    }
    mkdir src/win32cr
    Start-Process -Wait -NoNewWindow -FilePath .\bin\winmd.exe -ArgumentList "generate","${WINMD_PARAMS}","json\\win32json\\api","."
}

function BuildWinMD {

    if (!(Test-Path .\bin\winmd.exe)) {
        & .\scripts\build_winmd.ps1
    }
}


PrepSrcDir
PrepJSON
BuildWinMD
Run
CleanUp
