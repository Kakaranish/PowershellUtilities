# This script removes recursively .json files

[CmdletBinding()]
param (
    [string]
    $Path
)

if(-not $Path) {
    $Path = $PSScriptRoot
}

Get-ChildItem -Path $Path -Recurse -Filter "*.json" `
    | ForEach-Object { Remove-Item -Path $_.FullName -Force}