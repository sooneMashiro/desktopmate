# Instalador do Rust para Desktop Mascot
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  INSTALANDO RUST" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Baixa o instalador do Rust
Write-Host "[1/3] Baixando instalador do Rust..." -ForegroundColor Yellow
$rustupUrl = "https://win.rustup.rs/x86_64"
$rustupPath = "$env:TEMP\rustup-init.exe"

try {
    Invoke-WebRequest -Uri $rustupUrl -OutFile $rustupPath
    Write-Host "[OK] Download concluido!" -ForegroundColor Green
} catch {
    Write-Host "[ERRO] Falha ao baixar: $_" -ForegroundColor Red
    Read-Host "Pressione Enter para sair"
    exit 1
}

# Executa o instalador
Write-Host ""
Write-Host "[2/3] Instalando Rust..." -ForegroundColor Yellow
Write-Host "Uma janela vai abrir. Apenas pressione ENTER quando aparecer." -ForegroundColor Yellow
Write-Host ""

Start-Process -FilePath $rustupPath -ArgumentList "-y" -Wait -NoNewWindow

# Verifica instalação
Write-Host ""
Write-Host "[3/3] Verificando instalacao..." -ForegroundColor Yellow

$cargoPath = "$env:USERPROFILE\.cargo\bin\cargo.exe"
if (Test-Path $cargoPath) {
    Write-Host "[OK] Rust instalado com sucesso!" -ForegroundColor Green
} else {
    Write-Host "[AVISO] Rust pode ter sido instalado, mas precisa reiniciar o terminal" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  INSTALACAO CONCLUIDA!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "PROXIMO PASSO:" -ForegroundColor Yellow
Write-Host "1. FECHE este terminal" -ForegroundColor White
Write-Host "2. ABRA um novo terminal" -ForegroundColor White
Write-Host "3. Execute: start-safe.bat" -ForegroundColor White
Write-Host ""

Read-Host "Pressione Enter para sair"
