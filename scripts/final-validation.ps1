$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ModulesRoot = Join-Path $ProjectRoot "modules"
$ReportFolder = Join-Path $ProjectRoot "final-validation-report"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

New-Item -ItemType Directory -Path $ReportFolder -Force | Out-Null

$CsvPath = Join-Path $ReportFolder "terraform-validation-results-$Timestamp.csv"
$TxtPath = Join-Path $ReportFolder "terraform-validation-summary-$Timestamp.txt"

Write-Host "`n========== FINAL TERRAFORM VALIDATION ==========" -ForegroundColor Cyan

if (-not (Get-Command terraform -ErrorAction SilentlyContinue)) {
    throw "Terraform is not installed or unavailable in PATH."
}

if (-not (Test-Path $ModulesRoot)) {
    throw "Modules directory not found."
}

terraform version

# Discover actual Terraform modules only
$Modules = @(
    Get-ChildItem $ModulesRoot -Recurse -Filter "main.tf" |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.terraform[\\/]'
    } |
    ForEach-Object { $_.Directory.FullName } |
    Sort-Object -Unique
)

# Identify documentation-only module
$DocumentationModules = @(
    Get-ChildItem $ModulesRoot -Recurse -Directory |
    Where-Object {
        (Test-Path (Join-Path $_.FullName "README.md")) -and
        -not (Test-Path (Join-Path $_.FullName "main.tf"))
    }
)

Write-Host "`nTerraform modules discovered: $($Modules.Count)" -ForegroundColor Green
Write-Host "Documentation-only modules : $($DocumentationModules.Count)" -ForegroundColor Yellow

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
        $ValidateOutput = @("Skipped because Terraform init failed.")
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

$Results | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8

$InitPassed = @($Results | Where-Object Init -eq "PASS").Count
$InitFailed = @($Results | Where-Object Init -eq "FAIL").Count
$ValidatePassed = @($Results | Where-Object Validate -eq "PASS").Count
$ValidateFailed = @($Results | Where-Object Validate -eq "FAIL").Count
$ValidateSkipped = @($Results | Where-Object Validate -eq "SKIPPED").Count

$Summary = @"
AZURE TERRAFORM REUSABLE MODULES - FINAL VALIDATION
===================================================

Terraform modules discovered : $($Modules.Count)
Documentation-only modules   : $($DocumentationModules.Count)

Init passed                  : $InitPassed
Init failed                  : $InitFailed
Validation passed            : $ValidatePassed
Validation failed            : $ValidateFailed
Validation skipped           : $ValidateSkipped

Documentation-only modules:
$($DocumentationModules.FullName -join "`n")

No Azure resources were deployed.
Commands used: terraform init -backend=false and terraform validate.
"@

$Summary | Set-Content -Path $TxtPath -Encoding UTF8

Write-Host "`n========== FINAL SUMMARY ==========" -ForegroundColor Cyan
Write-Host "Terraform modules : $($Modules.Count)"
Write-Host "Documentation     : $($DocumentationModules.Count)"
Write-Host "Init passed       : $InitPassed"
Write-Host "Init failed       : $InitFailed"
Write-Host "Validate passed   : $ValidatePassed"
Write-Host "Validate failed   : $ValidateFailed"
Write-Host "Validate skipped  : $ValidateSkipped"

Write-Host "`nCSV Report: $CsvPath" -ForegroundColor Green
Write-Host "TXT Report: $TxtPath" -ForegroundColor Green

if ($InitFailed -gt 0 -or $ValidateFailed -gt 0 -or $ValidateSkipped -gt 0) {
    Write-Warning "Some modules need attention. Review the CSV report."
}
else {
    Write-Host "`nALL TERRAFORM MODULES VALIDATED SUCCESSFULLY." -ForegroundColor Green
}
