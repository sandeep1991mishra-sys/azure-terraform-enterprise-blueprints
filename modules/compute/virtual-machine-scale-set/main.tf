resource "azurerm_linux_virtual_machine_scale_set" "resource" {
  for_each = var.resources

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
}
