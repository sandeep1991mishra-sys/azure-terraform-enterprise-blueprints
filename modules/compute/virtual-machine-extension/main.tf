resource "azurerm_virtual_machine_extension" "resource" {
  for_each = var.resources

  name                 = each.value.name
  virtual_machine_id   = each.value.virtual_machine_id
  publisher            = each.value.publisher
  type                 = each.value.type
  type_handler_version = each.value.type_handler_version
  settings             = each.value.settings
  tags                 = each.value.tags
}
