# Script de inicio para desarrollo local
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Iniciando servicios en modo LOCAL" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan

# Verificar si Node.js está instalado
try {
    $nodeVersion = node --version
    Write-Host "✓ Node.js detectado: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Node.js no encontrado. Por favor instala Node.js" -ForegroundColor Red
    exit 1
}

# Verificar si Python está instalado
try {
    $pythonVersion = python --version
    Write-Host "✓ Python detectado: $pythonVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Python no encontrado. Por favor instala Python" -ForegroundColor Red
    exit 1
}

# Verificar entorno virtual
if (-not (Test-Path ".venv\Scripts\Activate.ps1")) {
    Write-Host "✗ Entorno virtual no encontrado. Ejecuta primero install.ps1" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Entorno virtual encontrado" -ForegroundColor Green

# Activar entorno virtual
Write-Host "`nActivando entorno virtual..." -ForegroundColor Yellow
& .\.venv\Scripts\Activate.ps1

# Verificar dependencias del frontend
Write-Host "`nVerificando dependencias del frontend..." -ForegroundColor Yellow
if (-not (Test-Path "frontend\node_modules")) {
    Write-Host "Instalando dependencias del frontend..." -ForegroundColor Yellow
    Set-Location frontend
    npm install
    Set-Location ..
}

Write-Host "✓ Dependencias del frontend listas" -ForegroundColor Green

# Instrucciones para el usuario
Write-Host "`n==================================" -ForegroundColor Cyan
Write-Host "INSTRUCCIONES DE INICIO" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan

Write-Host "`n1. FRONTEND (ya está corriendo):" -ForegroundColor Yellow
Write-Host "   Terminal actual muestra: http://localhost:3001" -ForegroundColor White

Write-Host "`n2. Para iniciar el BACKEND, abre una nueva terminal y ejecuta:" -ForegroundColor Yellow
Write-Host "   cd c:\janIntegrador" -ForegroundColor White
Write-Host "   .\.venv\Scripts\Activate.ps1" -ForegroundColor White
Write-Host "   cd api-gateway" -ForegroundColor White
Write-Host "   python app.py" -ForegroundColor White

Write-Host "`n3. Para iniciar todos los microservicios de una vez:" -ForegroundColor Yellow
Write-Host "   .\start-all-services.ps1" -ForegroundColor White

Write-Host "`n4. Para verificar que todo funciona:" -ForegroundColor Yellow
Write-Host "   .\verify-sync.ps1" -ForegroundColor White

Write-Host "`n==================================" -ForegroundColor Cyan
Write-Host "URLs DE ACCESO" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "🌐 Frontend:      http://localhost:3001" -ForegroundColor Green
Write-Host "🔧 API Gateway:   http://localhost:5000" -ForegroundColor Green
Write-Host "📊 Health Check:  http://localhost:5000/health" -ForegroundColor Green
Write-Host "📋 API Docs:      http://localhost:5000" -ForegroundColor Green

Write-Host "`n✨ El frontend ya está corriendo!" -ForegroundColor Green
Write-Host "Abre http://localhost:3001 en tu navegador" -ForegroundColor White