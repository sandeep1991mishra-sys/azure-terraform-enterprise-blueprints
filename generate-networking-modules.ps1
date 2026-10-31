
$ErrorActionPreference = "Stop"

# Run this script from your Terraform repository root.
$root = Join-Path (Get-Location) "modules\networking"

if (-not (Test-Path $root)) {
    throw "modules\networking folder nahi mila. Pehle project root folder open karo."
}

$modules = @(
    "virtual-hub",
    "vpn-gateway",
    "local-network-gateway",
    "expressroute-circuit",
    "expressroute-gateway",
    "vpn-connection",
    "bastion",
    "private-endpoint",
    "private-link-service",
    "load-balancer",
    "application-gateway",
    "traffic-manager",
    "azure-firewall",
    "firewall-policy",
    "front-door",
    "private-dns-zone",
    "private-dns-zone-vnet-link",
    "virtual-hub-routing"
)

foreach ($module in $modules) {
    $path = Join-Path $root $module
    New-Item -ItemType Directory -Path $path -Force | Out-Null

    $files = @("main.tf", "variables.tf", "outputs.tf", "README.md")

    foreach ($file in $files) {
        $filePath = Join-Path $path $file

        # Never overwrite existing files.
        if (-not (Test-Path $filePath)) {
            switch ($file) {
                "main.tf" {
                    $content = @"
# TODO: Add the AzureRM resource configuration for $module.
# Complete required arguments before using this module.
"@
                }
                "variables.tf" {
                    $content = @"
variable "resources" {
  description = "Resource configurations for the $module module."
  type        = any
  default     = {}
}
"@
                }
                "outputs.tf" {
                    $content = @"
# TODO: Add outputs after implementing the resource in main.tf.
"@
                }
                "README.md" {
                    $content = @"
# $module

Reusable Terraform module for Azure networking.

## Files

- main.tf: Azure resource configuration
- variables.tf: Module input variables
- outputs.tf: Module outputs

## Status

Scaffold created. Resource-specific arguments, validation, and usage examples
must be completed before using this module to deploy infrastructure.
"@
                }
            }

            Set-Content -Path $filePath -Value $content -Encoding utf8
        }
    }

    Write-Host "Created or checked: $module" -ForegroundColor Green
}

Write-Host "`nFinished checking all module folders." -ForegroundColor Cyan
Write-Host "Existing files were preserved." -ForegroundColor Yellow
