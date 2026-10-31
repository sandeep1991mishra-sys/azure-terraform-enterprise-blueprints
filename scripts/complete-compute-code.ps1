
$ErrorActionPreference = "Stop"

$root = "modules\compute"

# Each entry defines the AzureRM resource used by that module.
$definitions = [ordered]@{
    "linux-virtual-machine" = @{
        resource = "azurerm_linux_virtual_machine"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  size                = optional(string, "Standard_B1s")
  admin_username      = string
  network_interface_ids = list(string)
  admin_password      = optional(string)
  admin_ssh_key_username = optional(string)
  admin_ssh_public_key = optional(string)
  disable_password_authentication = optional(bool, true)
  tags                = optional(map(string), {})
'@
        body = @'
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  network_interface_ids           = each.value.network_interface_ids
  disable_password_authentication = each.value.disable_password_authentication
  tags                            = each.value.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  dynamic "admin_ssh_key" {
    for_each = each.value.admin_ssh_public_key == null ? [] : [each.value.admin_ssh_public_key]
    content {
      username   = each.value.admin_username
      public_key = admin_ssh_key.value
    }
  }
'@
    }
    "windows-virtual-machine" = @{
        resource = "azurerm_windows_virtual_machine"
        vars = @'
  name                  = string
  resource_group_name   = string
  location              = string
  size                  = optional(string, "Standard_B2s")
  admin_username        = string
  admin_password        = string
  network_interface_ids = list(string)
  tags                  = optional(map(string), {})
'@
        body = @'
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  admin_password        = each.value.admin_password
  network_interface_ids = each.value.network_interface_ids
  tags                  = each.value.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
'@
    }
    "virtual-machine-scale-set" = @{
        resource = "azurerm_linux_virtual_machine_scale_set"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  sku                 = optional(string, "Standard_B1s")
  instances           = optional(number, 1)
  admin_username      = string
  subnet_id           = string
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
  instances           = each.value.instances
  admin_username      = each.value.admin_username
  tags                = each.value.tags

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = "REPLACE_WITH_A_VALID_SSH_PUBLIC_KEY"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${each.value.name}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = each.value.subnet_id
    }
  }
'@
    }
    "managed-disk" = @{
        resource = "azurerm_managed_disk"
        vars = @'
  name                 = string
  resource_group_name  = string
  location             = string
  storage_account_type = optional(string, "Standard_LRS")
  create_option        = optional(string, "Empty")
  disk_size_gb         = number
  tags                 = optional(map(string), {})
'@
        body = @'
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
  tags                 = each.value.tags
'@
    }
    "disk-attachment" = @{
        resource = "azurerm_virtual_machine_data_disk_attachment"
        vars = @'
  managed_disk_id    = string
  virtual_machine_id = string
  lun                = number
  caching            = optional(string, "ReadWrite")
'@
        body = @'
  managed_disk_id    = each.value.managed_disk_id
  virtual_machine_id = each.value.virtual_machine_id
  lun                = each.value.lun
  caching            = each.value.caching
'@
    }
    "availability-set" = @{
        resource = "azurerm_availability_set"
        vars = @'
  name                         = string
  resource_group_name          = string
  location                     = string
  platform_fault_domain_count  = optional(number, 2)
  platform_update_domain_count = optional(number, 5)
  managed                      = optional(bool, true)
  tags                         = optional(map(string), {})
'@
        body = @'
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  platform_fault_domain_count  = each.value.platform_fault_domain_count
  platform_update_domain_count = each.value.platform_update_domain_count
  managed                      = each.value.managed
  tags                         = each.value.tags
'@
    }
    "proximity-placement-group" = @{
        resource = "azurerm_proximity_placement_group"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
'@
    }
    "dedicated-host-group" = @{
        resource = "azurerm_host_group"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  platform_fault_domain_count = number
  tags                = optional(map(string), {})
'@
        body = @'
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  location                    = each.value.location
  platform_fault_domain_count = each.value.platform_fault_domain_count
  tags                        = each.value.tags
'@
    }
    "dedicated-host" = @{
        resource = "azurerm_host"
        vars = @'
  name             = string
  host_group_id    = string
  sku_name         = string
  platform_fault_domain = number
  tags             = optional(map(string), {})
'@
        body = @'
  name                      = each.value.name
  host_group_id             = each.value.host_group_id
  sku_name                  = each.value.sku_name
  platform_fault_domain     = each.value.platform_fault_domain
  tags                      = each.value.tags
'@
    }
    "capacity-reservation-group" = @{
        resource = "azurerm_capacity_reservation_group"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  sharing_enabled     = optional(bool, false)
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sharing_enabled     = each.value.sharing_enabled
  tags                = each.value.tags
'@
    }
    "capacity-reservation" = @{
        resource = "azurerm_capacity_reservation"
        vars = @'
  name                          = string
  capacity_reservation_group_id = string
  sku_name                      = string
  capacity                      = number
  tags                          = optional(map(string), {})
'@
        body = @'
  name                          = each.value.name
  capacity_reservation_group_id = each.value.capacity_reservation_group_id
  sku_name                      = each.value.sku_name
  capacity                      = each.value.capacity
  tags                          = each.value.tags
'@
    }
    "shared-image-gallery" = @{
        resource = "azurerm_shared_image_gallery"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  description         = optional(string, "Reusable Azure Compute Gallery")
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  description         = each.value.description
  tags                = each.value.tags
'@
    }
    "gallery-image-definition" = @{
        resource = "azurerm_shared_image"
        vars = @'
  name                = string
  gallery_name        = string
  resource_group_name = string
  location            = string
  os_type             = string
  identifier_publisher = string
  identifier_offer     = string
  identifier_sku       = string
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  gallery_name        = each.value.gallery_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  os_type             = each.value.os_type
  identifier {
    publisher = each.value.identifier_publisher
    offer     = each.value.identifier_offer
    sku       = each.value.identifier_sku
  }
  tags = each.value.tags
'@
    }
    "gallery-image-version" = @{
        resource = "azurerm_shared_image_version"
        vars = @'
  name                = string
  image_name          = string
  gallery_name        = string
  resource_group_name = string
  location            = string
  managed_image_id    = string
  target_regions      = list(string)
'@
        body = @'
  name                = each.value.name
  image_name          = each.value.image_name
  gallery_name        = each.value.gallery_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  managed_image_id    = each.value.managed_image_id

  dynamic "target_region" {
    for_each = each.value.target_regions
    content {
      name                   = target_region.value
      regional_replica_count = 1
    }
  }
'@
    }
    "virtual-machine-extension" = @{
        resource = "azurerm_virtual_machine_extension"
        vars = @'
  name                 = string
  virtual_machine_id   = string
  publisher            = string
  type                 = string
  type_handler_version = string
  settings             = optional(string, "{}")
  tags                 = optional(map(string), {})
'@
        body = @'
  name                 = each.value.name
  virtual_machine_id   = each.value.virtual_machine_id
  publisher            = each.value.publisher
  type                 = each.value.type
  type_handler_version = each.value.type_handler_version
  settings             = each.value.settings
  tags                 = each.value.tags
'@
    }
    "virtual-machine-run-command" = @{
        resource = "azurerm_virtual_machine_run_command"
        vars = @'
  name               = string
  location           = string
  virtual_machine_id = string
  source_script      = string
'@
        body = @'
  name               = each.value.name
  location           = each.value.location
  virtual_machine_id = each.value.virtual_machine_id

  source {
    script = each.value.source_script
  }
'@
    }
    "virtual-machine-data-disk" = @{
        resource = "azurerm_managed_disk"
        vars = @'
  name                 = string
  resource_group_name  = string
  location             = string
  disk_size_gb         = number
  storage_account_type = optional(string, "Standard_LRS")
  tags                 = optional(map(string), {})
'@
        body = @'
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  disk_size_gb         = each.value.disk_size_gb
  storage_account_type = each.value.storage_account_type
  create_option        = "Empty"
  tags                 = each.value.tags
'@
    }
    "proximity-placement-group-association" = @{
        resource = "azurerm_proximity_placement_group"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  tags                = each.value.tags
'@
    }
    "automatic-guest-patching" = @{
        resource = "azurerm_linux_virtual_machine"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  size                = string
  admin_username      = string
  network_interface_ids = list(string)
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = each.value.network_interface_ids
  patch_mode          = "AutomaticByPlatform"
  reboot_setting      = "IfRequired"
  tags                = each.value.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = "REPLACE_WITH_A_VALID_SSH_PUBLIC_KEY"
  }
'@
    }
    "boot-diagnostics" = @{
        resource = "azurerm_linux_virtual_machine"
        vars = @'
  name                = string
  resource_group_name = string
  location            = string
  size                = string
  admin_username      = string
  network_interface_ids = list(string)
  boot_diagnostics_storage_account_uri = optional(string)
  tags                = optional(map(string), {})
'@
        body = @'
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = each.value.network_interface_ids
  tags                = each.value.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = "REPLACE_WITH_A_VALID_SSH_PUBLIC_KEY"
  }

  boot_diagnostics {
    storage_account_uri = each.value.boot_diagnostics_storage_account_uri
  }
'@
    }
}

foreach ($moduleName in $definitions.Keys) {
    $definition = $definitions[$moduleName]
    $folder = Join-Path $root $moduleName
    New-Item -ItemType Directory -Path $folder -Force | Out-Null

    $main = @"
resource "$($definition.resource)" "resource" {
  for_each = var.resources

$($definition.body)
}
"@

    $variables = @"
variable "resources" {
  description = "Resource configurations for the $moduleName module."
  type = map(object({
$($definition.vars)
  }))
  default = {}
}
"@

    $outputs = @"
output "ids" {
  description = "IDs of created resources."
  value = { for key, resource in $($definition.resource).resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value = { for key, resource in $($definition.resource).resource : key => resource.name }
}
"@

    $readme = @"
# $moduleName

Reusable Terraform module for Azure resource type `$($definition.resource)`.

## Input

The module accepts a map named `resources`. Each map entry defines one resource instance.

## Example

````hcl
module "example" {
  source = "../../modules/compute/$moduleName"

  resources = {
    example1 = {
      # Fill in the required attributes from variables.tf
    }
  }
}
````

## Outputs

- `ids`: resource IDs
- `names`: resource names

Review required arguments and AzureRM provider compatibility before deployment.
"@

    # Write files only when missing, to avoid overwriting existing work.
    $files = @{
        "main.tf"      = $main
        "variables.tf" = $variables
        "outputs.tf"   = $outputs
        "README.md"    = $readme
    }

    foreach ($fileName in $files.Keys) {
        $filePath = Join-Path $folder $fileName
        if (-not (Test-Path $filePath)) {
            Set-Content -Path $filePath -Value $files[$fileName] -Encoding utf8
        }
        else {
            Write-Host "Skipped existing file: $filePath"
        }
    }

    Write-Host "Processed: $moduleName"
}

Write-Host ""
Write-Host "Compute code generation completed."
Write-Host "Existing files were preserved."
Write-Host "No Terraform init, validate, or Azure deployment was run."
