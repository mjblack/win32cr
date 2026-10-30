# Regenerates src/win32cr from Windows.Win32.winmd.
#
# 1. Builds winmd.exe from the installed winmd shard (lib/winmd) if needed.
# 2. Fetches the Windows.Win32.winmd version pinned in winmd.version (this
#    repo) into winmd/, using the fetch script shipped with the winmd shard.
# 3. Runs `winmd generate --source-format winmd` with the override files in
#    this directory (data_type_aliases.json, dll_exceptions.json,
#    overrides.json). Functions that Crystal's own LibC declares are found
#    by winmd from the installed compiler; they need no exception list.
#
# Environment:
#   WINMD_CACHE=1   reuse an already fetched winmd\Windows.Win32.winmd
#   WINMD_DEBUG=1   pass --debug to winmd generate
$ErrorActionPreference = "Stop"
$winmdFile = Join-Path $PWD "winmd\Windows.Win32.winmd"

# Wipe the generated tree so namespaces that disappear from the metadata do
# not leave stale files behind. src/win32cr.cr is rewritten on every run and
# src/macros.cr is hand-maintained, so neither needs removing.
function PrepSrcDir {
    if (Test-Path -Path .\src\win32cr) { Remove-Item -Path src/win32cr -Force -Recurse }
}

function BuildWinMD {
    if (!(Test-Path .\bin\winmd.exe)) {
        & .\scripts\build_winmd.ps1
    }
}

function FetchWinMD {
    if ($env:WINMD_CACHE -and (Test-Path $winmdFile)) {
        Write-Host "Using cached $winmdFile"
        return
    }
    if (!(Test-Path .\lib\winmd\scripts\fetch-winmd.ps1)) {
        throw "winmd shard not installed; run 'shards install' first"
    }
    $version = (Get-Content .\winmd.version | Where-Object { $_.Trim() -and -not $_.Trim().StartsWith("#") } | Select-Object -First 1).Trim()
    if (!$version) { throw "winmd.version is empty" }
    & .\lib\winmd\scripts\fetch-winmd.ps1 -Version $version -OutputPath $winmdFile
}

function Run {
    $params = @("generate", "--source-format", "winmd", "--associated-enums")
    if ($env:WINMD_DEBUG) { $params += "--debug" }
    $params += @($winmdFile, ".")
    & .\bin\winmd.exe @params
    if ($LASTEXITCODE -ne 0) { throw "winmd generate failed" }
}

PrepSrcDir
BuildWinMD
FetchWinMD
Run
