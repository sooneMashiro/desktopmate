@echo off
title Upload para GitHub
color 0B
echo ========================================
echo   UPLOAD PARA GITHUB
echo ========================================
echo.
echo Este script vai subir seu projeto para o GitHub
echo para que ele compile automaticamente na nuvem!
echo.
echo IMPORTANTE: Voce precisa ter criado o repositorio antes!
echo Acesse: https://github.com/new
echo.
pause
echo.

REM Verifica se git está instalado
where git >nul 2>nul
if %errorlevel% neq 0 (
    color 0C
    echo [ERRO] Git nao esta instalado!
    echo.
    echo Baixe em: https://git-scm.com/download/win
    echo Instale e rode este script novamente.
    echo.
    pause
    exit /b 1
)

echo [1/5] Inicializando Git...
git init

echo.
echo [2/5] Adicionando arquivos...
git add .

echo.
echo [3/5] Criando commit...
git commit -m "Initial commit - Desktop Mascot"

echo.
echo [4/5] Configurando branch...
git branch -M main

echo.
echo ========================================
echo   CONFIGURACAO DO REPOSITORIO
echo ========================================
echo.
echo Cole a URL do seu repositorio do GitHub
echo Exemplo: https://github.com/seu-usuario/desktop-mascot
echo.
set /p REPO_URL="URL do repositorio: "

echo.
echo [5/5] Conectando ao GitHub...
git remote add origin %REPO_URL%

echo.
echo ========================================
echo   ENVIANDO PARA O GITHUB
echo ========================================
echo.
echo IMPORTANTE: Quando pedir senha, use um TOKEN
echo Veja como criar: https://github.com/settings/tokens
echo.
echo Enviando arquivos...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   SUCESSO!
    echo ========================================
    echo.
    echo Arquivos enviados com sucesso!
    echo.
    echo PROXIMO PASSO:
    echo 1. Acesse seu repositorio no GitHub
    echo 2. Clique em "Actions"
    echo 3. Aguarde a compilacao (~10 minutos)
    echo 4. Baixe o .exe em "Artifacts"
    echo.
) else (
    echo.
    echo ========================================
    echo   ERRO AO ENVIAR
    echo ========================================
    echo.
    echo Verifique:
    echo - URL do repositorio esta correta?
    echo - Voce usou o TOKEN em vez da senha?
    echo - Voce tem permissao no repositorio?
    echo.
)

pause
