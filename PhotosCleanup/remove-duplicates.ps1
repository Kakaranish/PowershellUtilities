[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $Path
)

$duplicate_suffix = "edytowane"

$to_delete = Get-ChildItem -Filter "*${duplicate_suffix}*" -Recurse -File
$to_delete | ForEach-Object { $_.FullName }

Write-Host "Do you want to remove those files [y/n]: ?"
$choice = Read-Host

if(-not($choice -like "[Yy]")) {
    Write-Host "Aborted"
    exit
}

$to_delete | ForEach-Object { Remove-Item -Path $_.FullName -Force }