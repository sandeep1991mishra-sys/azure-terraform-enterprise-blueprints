
# ============================================================
# Azure Terraform Modules - Repair and Validation Script
# Project: azure-terraform-enterprise-blueprints
# Terraform version: Uses installed Terraform
# No Azure resources will be deployed.
# ============================================================

$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ModulesRoot = Join-Path $ProjectRoot "modules"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

$BackupRoot = Join-Path $ProjectRoot "backup-before-repair_$Timestamp"
$ReportPath = Join-Path $ProjectRoot "repair-report_$Timestamp.txt"
$CsvPath = Join-Path $ProjectRoot "repair-report_$Timestamp.csv"

Write-Host "`n========== TERRAFORM MODULE REPAIR ==========" -ForegroundColor Cyan

# Check Terraform installation
if (-not (Get-Command terraform -ErrorAction SilentlyContinue)) {
    throw "Terraform is not installed or not available in PATH."
}

terraform version

if (-not (Test-Path $ModulesRoot)) {
    throw "Modules folder not found: $ModulesRoot"
}

# Discover modules
$Modules = Get-ChildItem $ModulesRoot -Recurse -Filter "main.tf" |
    ForEach-Object { $_.Directory.FullName } |
    Sort-Object -Unique

Write-Host "`nTotal modules discovered: $($Modules.Count)" -ForegroundColor Green

# Backup all Terraform files
Write-Host "`nCreating backup..." -ForegroundColor Yellow

$TerraformFiles = Get-ChildItem $ModulesRoot -Recurse -File |
    Where-Object { $_.Extension -eq ".tf" -or $_.Name -eq ".tf.json" }

foreach ($File in $TerraformFiles) {
    $RelativePath = $File.FullName.Substring($ProjectRoot.Length).TrimStart('\')
    $BackupFile = Join-Path $BackupRoot $RelativePath
    $BackupDirectory = Split-Path $BackupFile -Parent

    New-Item -ItemType Directory -Path $BackupDirectory -Force |
        Out-Null

    Copy-Item $File.FullName $BackupFile -Force
}

Write-Host "Backup created: $BackupRoot" -ForegroundColor Green

# Remove UTF-8 BOM from Terraform files
Write-Host "`nChecking UTF-8 BOM..." -ForegroundColor Yellow

$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$BomFixed = 0

foreach ($File in $TerraformFiles) {
    $Bytes = [System.IO.File]::ReadAllBytes($File.FullName)

    if ($Bytes.Length -ge 3 -and
        $Bytes[0] -eq 0xEF -and
        $Bytes[1] -eq 0xBB -and
        $Bytes[2] -eq 0xBF) {

        $Content = [System.IO.File]::ReadAllText($File.FullName)
        [System.IO.File]::WriteAllText(
            $File.FullName,
            $Content,
            $Utf8NoBom
        )

        $BomFixed++
        Write-Host "BOM removed: $($File.FullName)" -ForegroundColor Green
    }
}

# Format all Terraform files
Write-Host "`nRunning terraform fmt..." -ForegroundColor Yellow

Push-Location $ProjectRoot
try {
    terraform fmt -recursive
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "Terraform formatting returned an error."
    }
}
finally {
    Pop-Location
}

# Initialize and validate every module
$Results = @()
$Index = 0

foreach ($ModulePath in $Modules) {

    $Index++
    $ModuleName = $ModulePath.Substring($ProjectRoot.Length).TrimStart('\')

    Write-Host "`n[$Index/$($Modules.Count)] $ModuleName" -ForegroundColor Cyan

    $InitOutput = & terraform "-chdir=$ModulePath" init `
        -backend=false -input=false -no-color 2>&1

    $InitExit = $LASTEXITCODE
    $InitStatus = if ($InitExit -eq 0) { "PASS" } else { "FAIL" }

    if ($InitExit -eq 0) {
        $ValidateOutput = & terraform "-chdir=$ModulePath" validate -no-color 2>&1
        $ValidateExit = $LASTEXITCODE
        $ValidateStatus = if ($ValidateExit -eq 0) { "PASS" } else { "FAIL" }
    }
    else {
        $ValidateOutput = @("Skipped: Terraform init failed.")
        $ValidateStatus = "SKIPPED"
    }

    $Results += [PSCustomObject]@{
        Module   = $ModuleName
        Init     = $InitStatus
        Validate = $ValidateStatus
        Details  = (($InitOutput + $ValidateOutput) -join "`n")
    }

    Write-Host "Init: $InitStatus | Validate: $ValidateStatus"
}

# Save reports
$Results | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8

$Results | Format-List * | Out-File -FilePath $ReportPath -Encoding UTF8

# Final summary
$InitPassed = @($Results | Where-Object Init -eq "PASS").Count
$ValidatePassed = @($Results | Where-Object Validate -eq "PASS").Count
$ValidateFailed = @($Results | Where-Object Validate -eq "FAIL").Count

Write-Host "`n========== FINAL SUMMARY ==========" -ForegroundColor Cyan
Write-Host "Total modules       : $($Modules.Count)"
Write-Host "UTF-8 BOM fixed     : $BomFixed"
Write-Host "Init passed         : $InitPassed"
Write-Host "Validate passed     : $ValidatePassed"
Write-Host "Validate failed     : $ValidateFailed"
Write-Host "`nBackup: $BackupRoot" -ForegroundColor Green
Write-Host "TXT Report: $ReportPath" -ForegroundColor Green
Write-Host "CSV Report: $CsvPath" -ForegroundColor Green
