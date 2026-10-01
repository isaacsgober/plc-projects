@echo off
set "script=%~dpn0.ps1"
powershell -NoProfile -Command "(Get-Help '%script%').Synopsis; ''; & '%script%'"