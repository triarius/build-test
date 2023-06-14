#!/usr/bin/pwsh

Set-StrictMode -Version Latest

Get-Host | Select-Object Version
buildkite-agent --version
docker --version

[System.Environment]::OSVersion.Version

Write-Host "Hello From Nepa"
