@echo off
title Adicionando Excecao no Windows Defender
color 0E
echo ========================================
echo   CONFIGURANDO WINDOWS DEFENDER
echo ========================================
echo.
echo Este script vai adicionar a pasta do projeto
echo como excecao no Windows Defender
echo.
echo IMPORTANTE: Execute como ADMINISTRADOR
echo (Clique direito -^> Executar como administrador)
echo.
pause
echo.
echo Adicionando excecao...
echo.

PowerShell -Command "Add-MpPreference -ExclusionPath 'C:\Users\gabriel.teles\Documents\desktop-mascot'"

if %errorlevel% equ 0 (
    echo.
    echo [OK] Excecao adicionada com sucesso!
    echo.
    echo Agora tente rodar: start-safe.bat
) else (
    echo.
    echo [ERRO] Falha ao adicionar excecao.
    echo Certifique-se de executar como ADMINISTRADOR
)

echo.
pause
