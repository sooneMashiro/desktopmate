@echo off
cd /d "%~dp0"
echo Iniciando Desktop Mascot...
echo.
cmd /k npm run tauri:dev
