# This script flattens directory structure but vulnerable to name duplication

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $SourcePath,

    [Parameter()]
    [string]
    $DestinationPath
)

if(-not $SourcePath){
    $SourcePath = $PSScriptRoot
}

if(-not $DestinationPath) {
    $DestinationPath = $SourcePath
}

Get-ChildItem -Path $SourcePath -File -Recurse `
    | Select-Object { Move-Item -Path $_.FullName -Destination "$DestinationPath\$($_.Name)" } `
    | Out-Null

Write-Host "OK"