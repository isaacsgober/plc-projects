<#
.SYNOPSIS
Compare project files pulled from GitHub against the working copy.

.DESCRIPTION
Hashes every PLC and HMI project file in github\GolfBall and compares it
with the matching file in working. Reports MATCH, DIFF, or MISSING for
each file, to confirm the GitHub copy is identical before replacing the
last session's files.

.NOTES
Author:  Isaac Gober
Created: 2026-10-01
Add new project file extensions to the -Include list.
#>

$src  = Join-Path $PSScriptRoot 'github\GolfBall'
$dst  = Join-Path $PSScriptRoot 'working'
$base = (Resolve-Path $src).Path

Get-ChildItem $src -File -Recurse -Include *.ACD, *.L5K, *.L5X, *.cd32 | ForEach-Object {
    $rel   = $_.FullName.Substring($base.Length).TrimStart('\')
    $other = Join-Path $dst $rel
    if (-not (Test-Path $other)) { "MISSING  $rel"; return }
    $a = (Get-FileHash $_.FullName).Hash
    $b = (Get-FileHash $other).Hash
    if ($a -eq $b) { "MATCH    $rel" } else { "DIFF     $rel" }
}
Read-Host "`nPress Enter to close"
