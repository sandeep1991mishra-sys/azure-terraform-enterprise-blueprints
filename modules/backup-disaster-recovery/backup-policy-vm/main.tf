resource "azurerm_backup_policy_vm" "this" {
  for_each            = var.policies
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  recovery_vault_name = each.value.recovery_vault_name
  backup {
    frequency = each.value.backup.frequency
    time      = each.value.backup.time
  }
  retention_daily { count = each.value.retention_daily.count }
}
