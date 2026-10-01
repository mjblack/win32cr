# Builds winmd.exe from the installed winmd shard (lib/winmd) into bin/.
# Uses the `crystal` on PATH, so it works with any Crystal installation,
# including crystal-lang/install-crystal on GitHub runners.
$ErrorActionPreference = "Stop"

if (!(Test-Path .\lib\winmd)) {
    throw "winmd shard not found in lib/; run 'shards install' first"
}

if (!(Test-Path .\lib\winmd\bin\winmd.exe)) {
    Push-Location .\lib\winmd
    try {
        New-Item -ItemType Directory -Force -Path bin | Out-Null
        crystal build src/cli.cr -o bin/winmd.exe --release --static
        if ($LASTEXITCODE -ne 0) { throw "crystal build of winmd failed" }
    } finally {
        Pop-Location
    }
}

New-Item -ItemType Directory -Force -Path bin | Out-Null
Copy-Item .\lib\winmd\bin\winmd.exe .\bin\winmd.exe
& .\bin\winmd.exe --version
