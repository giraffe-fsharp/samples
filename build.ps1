# ----------------------------------------------
# Build script
# ----------------------------------------------

$ErrorActionPreference = "Stop"

Import-module "$PSScriptRoot/.psscripts/build-functions.ps1" -Force

Write-BuildHeader "Starting Giraffe samples build script"

Remove-OldBuildArtifacts
if ($ClearOnly.IsPresent) { return }

Write-DotnetCoreVersions

Write-Host "Building all sample applications..." -ForegroundColor Magenta

Get-ChildItem "*.fsproj" -Recurse -Exclude *.Tests.fsproj | ForEach-Object {
    dotnet-build $_.FullName
}

Write-Host "Running all sample application tests..." -ForegroundColor Magenta

Get-ChildItem "*.Tests.fsproj" -Recurse | ForEach-Object {
    dotnet-test $_.FullName
}

Write-SuccessFooter "Giraffe sample applications have been successfully built and tested!"