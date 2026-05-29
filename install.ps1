# Stock-Info App 安裝腳本
# 使用方式: 以 PowerShell 執行此腳本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Stock-Info App 安裝程式" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# 檢查 Flutter 是否已安裝
Write-Host "`n[1/4] 檢查 Flutter 環境..." -ForegroundColor Yellow
try {
    $flutterVersion = flutter --version 2>&1 | Select-String "Flutter"
    Write-Host "✓ Flutter 已安裝: $flutterVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ 找不到 Flutter，請先安裝 Flutter: https://flutter.dev/docs/get-started/install" -ForegroundColor Red
    exit 1
}

# 進入專案目錄
Write-Host "`n[2/4] 進入專案目錄..." -ForegroundColor Yellow
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location "$scriptDir\stocks"

if (-Not (Test-Path "pubspec.yaml")) {
    Write-Host "✗ 找不到 pubspec.yaml，請確認專案結構正確" -ForegroundColor Red
    exit 1
}
Write-Host "✓ 專案目錄: $scriptDir\stocks" -ForegroundColor Green

# 安裝套件
Write-Host "`n[3/4] 安裝 Flutter 套件..." -ForegroundColor Yellow
flutter pub get
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ 套件安裝失敗" -ForegroundColor Red
    exit 1
}
Write-Host "✓ 套件安裝完成" -ForegroundColor Green

# 列出可用裝置
Write-Host "`n[4/4] 偵測可用裝置..." -ForegroundColor Yellow
flutter devices

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  安裝完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "執行以下指令啟動 App：" -ForegroundColor White
Write-Host ""
Write-Host "  cd stocks" -ForegroundColor Yellow
Write-Host "  flutter run" -ForegroundColor Yellow
Write-Host ""
Write-Host "指定裝置執行：" -ForegroundColor White
Write-Host "  flutter run -d <device_id>" -ForegroundColor Yellow
Write-Host ""
