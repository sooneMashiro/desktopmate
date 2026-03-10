@echo off
title Limpando Cache
color 0E
echo ========================================
echo   LIMPANDO CACHE DE COMPILACAO
echo ========================================
echo.
echo Isso vai deletar arquivos temporarios
echo e tentar compilar novamente
echo.
pause
echo.
echo [1/2] Limpando cache...
echo.

cd /d "%~dp0"
rmdir /s /q src-tauri\target 2>nul

echo [OK] Cache limpo!
echo.
echo [2/2] Tentando compilar novamente...
echo.
echo IMPORTANTE: Se der o mesmo erro, execute:
echo fix-defender.bat como ADMINISTRADOR
echo.
pause

call npm run tauri:dev

pause
