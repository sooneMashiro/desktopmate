@echo off
title Instalando Git
color 0E
echo ========================================
echo   INSTALANDO GIT
echo ========================================
echo.
echo O Git e necessario para subir o codigo pro GitHub
echo.
echo Instalando...
echo.

winget install --id Git.Git -e --source winget

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   GIT INSTALADO COM SUCESSO!
    echo ========================================
    echo.
    echo IMPORTANTE: 
    echo 1. FECHE este terminal
    echo 2. FECHE o VS Code
    echo 3. ABRA o VS Code novamente
    echo 4. Depois rode: upload-to-github.bat
    echo.
) else (
    echo.
    echo ========================================
    echo   ERRO NA INSTALACAO
    echo ========================================
    echo.
    echo Tente instalar manualmente:
    echo https://git-scm.com/download/win
    echo.
)

pause
