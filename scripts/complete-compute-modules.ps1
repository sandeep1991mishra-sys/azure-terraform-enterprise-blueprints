$ErrorActionPreference = "Stop"

$root = "modules\compute"

$modules = @(
    "linux-virtual-machine",
    "windows-virtual-machine",
    "virtual-machine-scale-set",
    "managed-disk",
    "disk-attachment",
    "availability-set",
    "proximity-placement-group",
    "dedicated-host",
    "dedicated-host-group",
    "capacity-reservation",
    "shared-image-gallery",
    "gallery-image-definition",
    "gallery-image-version",
    "virtual-machine-extension",
    "virtual-machine-run-command",
    "virtual-machine-data-disk",
    "proximity-placement-group-association",
    "capacity-reservation-group",
    "automatic-guest-patching",
    "boot-diagnostics"
)

foreach ($module in $modules) {
    $path = Join-Path $root $module

    New-Item -ItemType Directory -Path $path -Force |
        Out-Null

    Write-Host "Prepared: $module"
}

Write-Host ""
Write-Host "Compute module folders prepared."
Write-Host "No Terraform init, validate, or Azure deployment was run."