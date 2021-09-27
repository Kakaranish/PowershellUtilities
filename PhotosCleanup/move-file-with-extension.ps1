# This script moves files with extension in extensions set to destination path

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $SourcePath,

    [Parameter()]
    [string]
    $DestinationPath,

    [Parameter()]
    [string[]]
    $Extensions
)

if(-not $SourcePath) {
    $SourcePath = $PSScriptRoot
}

if(-not $DestinationPath) {
    $DestinationPath = $SourcePath
}

Get-ChildItem -Path $SourcePath `
    | Where-Object { $_.Extension.ToLower() -cin $Extensions } `
    | ForEach-Object { Move-Item -Path $_.FullName -Destination "$DestinationPath\$($_.BaseName)" }