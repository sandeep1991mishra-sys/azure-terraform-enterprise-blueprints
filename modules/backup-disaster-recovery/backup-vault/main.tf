resource "azurerm_data_protection_backup_vault" "this" {
  for_each = var.vaults
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  datastore_type      = each.value.datastore_type
  redundancy          = each.value.redundancy
  tags = each.value.tags
}
