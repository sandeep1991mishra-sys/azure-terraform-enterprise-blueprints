resource "azurerm_linux_virtual_machine" "resource" {
  for_each = var.resources

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
}
