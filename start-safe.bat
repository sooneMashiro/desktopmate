@echo off
title Desktop Mascot - Verificando...
color 0A

echo ========================================
echo   Desktop Mascot - Verificando...
echo ========================================
echo.

REM Verifica se cargo existe
where cargo >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo [ERRO] Rust nao esta instalado!
    echo.
    echo Para instalar o Rust:
    echo 1. De duplo clique em: install-rust.bat
    echo 2. Aguarde a instalacao
    echo 3. FECHE este terminal
    echo 4. ABRA um novo terminal
    echo 5. Rode este script novamente
    echo.
    echo OU instale manualmente:
    echo https://rustup.rs/
    echo.
    pause
    exit /b 1
)

echo [OK] Rust esta instalado!
echo [OK] Iniciando mascote...
echo.
echo [INFO] Primeira vez: 5-10 minutos compilando
echo [INFO] Proximas vezes: 2-3 segundos
echo.
echo [AGUARDE] O icone aparecera na bandeja!
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
) else (
    echo.
    echo ========================================
    echo [ENCERRADO] Mascote foi fechado.
    echo ========================================
    echo.
)

pause
