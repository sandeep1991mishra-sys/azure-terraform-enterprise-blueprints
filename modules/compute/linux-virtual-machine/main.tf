resource "azurerm_linux_virtual_machine" "resource" {
  for_each = var.resources

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
}
