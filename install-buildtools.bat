@echo off
title Instalando Build Tools
color 0E
echo ========================================
echo   INSTALANDO BUILD TOOLS
echo ========================================
echo.
echo O Rust precisa das ferramentas de compilacao C++
echo Isso vai instalar o Visual Studio Build Tools
echo.
echo ATENCAO: Download grande (~1-2 GB)
echo.
pause
echo.
echo [1/1] Instalando Build Tools...
echo Isso pode demorar 10-20 minutos...
echo.

winget install Microsoft.VisualStudio.2022.BuildTools --silent --override "--wait --quiet --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended"

echo.
echo ========================================
echo   INSTALACAO CONCLUIDA!
echo ========================================
echo.
echo Agora:
echo 1. REINICIE o computador (importante!)
echo 2. Depois rode: start-safe.bat
echo.
pause
