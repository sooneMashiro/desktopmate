@echo off
title Instalando Rust para Desktop Mascot
color 0E
echo ========================================
echo   INSTALACAO DO RUST
echo ========================================
echo.
echo Este script vai instalar o Rust (necessario para o mascote)
echo.
echo Pressione qualquer tecla para continuar...
pause >nul
echo.
echo [1/2] Baixando e instalando Rust...
echo.

winget install --id Rustlang.Rustup -e

echo.
echo [2/2] Configurando variaveis de ambiente...
echo.
echo IMPORTANTE: Apos a instalacao, voce precisa:
echo 1. FECHAR este terminal
echo 2. ABRIR um novo terminal
echo 3. Rodar: start.bat
echo.
echo ========================================
echo   INSTALACAO CONCLUIDA!
echo ========================================
echo.
echo Agora feche este terminal e abra um novo!
echo.
pause
