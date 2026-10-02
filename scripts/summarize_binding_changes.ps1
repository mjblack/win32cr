# Summarizes changes to the generated bindings as Markdown.
#
# Compares the working tree (or -Head) against -Base and reports, per kind of
# declaration, the symbols that were added or removed in src/win32cr. Lines
# that merely moved are ignored because the comparison is by name.
#
#   pwsh scripts/summarize_binding_changes.ps1                 # working tree vs HEAD
#   pwsh scripts/summarize_binding_changes.ps1 -Base v1.2.1 -Head HEAD
[CmdletBinding()]
param(
  [string]$Base = "HEAD",
  [string]$Head = "",
  [int]$MaxNames = 40
)

$ErrorActionPreference = "Stop"

# Built explicitly: assigning @($Base) from an if-expression would unroll the
# single-element array into a string and splat it character by character.
[string[]]$range = @($Base)
if ($Head) { $range += $Head }
$numstat = git diff --numstat @range -- src
$files = @($numstat | Where-Object { $_ })
$added = 0; $removed = 0
foreach ($line in $files) {
  $parts = $line -split "`t"
  if ($parts[0] -match '^\d+$') { $added += [int]$parts[0] }
  if ($parts[1] -match '^\d+$') { $removed += [int]$parts[1] }
}

$kinds = [ordered]@{
  "fun"      = @{ Plus = New-Object System.Collections.Generic.HashSet[string]; Minus = New-Object System.Collections.Generic.HashSet[string] }
  "struct"   = @{ Plus = New-Object System.Collections.Generic.HashSet[string]; Minus = New-Object System.Collections.Generic.HashSet[string] }
  "enum"     = @{ Plus = New-Object System.Collections.Generic.HashSet[string]; Minus = New-Object System.Collections.Generic.HashSet[string] }
  "alias"    = @{ Plus = New-Object System.Collections.Generic.HashSet[string]; Minus = New-Object System.Collections.Generic.HashSet[string] }
  "record"   = @{ Plus = New-Object System.Collections.Generic.HashSet[string]; Minus = New-Object System.Collections.Generic.HashSet[string] }
  "constant" = @{ Plus = New-Object System.Collections.Generic.HashSet[string]; Minus = New-Object System.Collections.Generic.HashSet[string] }
}

$declaration = '^([+-])\s+(fun|struct|enum|alias|record)\s+([A-Za-z_][A-Za-z0-9_]*)'
$constant    = '^([+-])\s{2}([A-Z][A-Za-z0-9_]*)\s*=\s'

git diff -U0 @range -- src | ForEach-Object {
  if ($_ -match $declaration) {
    $set = if ($Matches[1] -eq '+') { 'Plus' } else { 'Minus' }
    [void]$kinds[$Matches[2]][$set].Add($Matches[3])
  } elseif ($_ -match $constant) {
    $set = if ($Matches[1] -eq '+') { 'Plus' } else { 'Minus' }
    [void]$kinds['constant'][$set].Add($Matches[2])
  }
}

"### Generated bindings"
""
"$($files.Count) file(s) changed, +$added / -$removed lines."
""
"| Kind | Added | Removed |"
"|---|---|---|"
foreach ($kind in $kinds.Keys) {
  $plus = $kinds[$kind].Plus; $minus = $kinds[$kind].Minus
  $onlyAdded = @($plus | Where-Object { -not $minus.Contains($_) })
  $onlyRemoved = @($minus | Where-Object { -not $plus.Contains($_) })
  $kinds[$kind].OnlyAdded = $onlyAdded
  $kinds[$kind].OnlyRemoved = $onlyRemoved
  "| $kind | $($onlyAdded.Count) | $($onlyRemoved.Count) |"
}

foreach ($kind in $kinds.Keys) {
  foreach ($direction in @('OnlyAdded', 'OnlyRemoved')) {
    $names = @($kinds[$kind][$direction] | Sort-Object)
    if ($names.Count -eq 0) { continue }
    $label = if ($direction -eq 'OnlyAdded') { 'Added' } else { 'Removed' }
    ""
    "<details><summary>$label $kind ($($names.Count))</summary>"
    ""
    $shown = $names | Select-Object -First $MaxNames
    ($shown | ForEach-Object { '`' + $_ + '`' }) -join ', '
    if ($names.Count -gt $MaxNames) { "... and $($names.Count - $MaxNames) more" }
    ""
    "</details>"
  }
}
