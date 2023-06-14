#!/usr/bin/pwsh

Set-StrictMode -Version Latest

Get-Host | Select-Object Version
buildkite-agent --version
docker --version

Write-Host "Hello From Nepa"
