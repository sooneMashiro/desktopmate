@echo off
title Desktop Mascot - Iniciando...
color 0A
echo ========================================
echo   Desktop Mascot - Iniciando...
echo ========================================
echo.
echo [INFO] Compilando o mascote...
echo [INFO] Primeira vez: 5-10 minutos
echo [INFO] Proximas vezes: 2-3 segundos
echo.
echo [AGUARDE] O icone aparecera na bandeja quando terminar!
echo.
echo ========================================
echo.

call npm run tauri:dev

if errorlevel 1 (
    echo.
    echo ========================================
    echo [ERRO] Algo deu errado!
    echo ========================================
    echo.
    echo Verifique se:
    echo - Node.js esta instalado
    echo - Rust esta instalado
    echo - Voce rodou: npm install
    echo.
) else (
    echo.
    echo ========================================
    echo [ENCERRADO] Mascote foi fechado.
    echo ========================================
    echo.
)

pause
