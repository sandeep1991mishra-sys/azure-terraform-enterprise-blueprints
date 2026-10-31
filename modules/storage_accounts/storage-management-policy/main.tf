resource "azurerm_storage_management_policy" "this" {
  for_each           = var.policies
  storage_account_id = each.value.storage_account_id
  dynamic "rule" {
    for_each = each.value.rules
    content {
      name    = rule.value.name
      enabled = rule.value.enabled
      filters {
        prefix_match = rule.value.prefix_match
        blob_types   = rule.value.blob_types
      }
      actions {
        base_blob {
          delete_after_days_since_modification_greater_than = rule.value.base_blob_days_after_modification_greater_than
        }
        snapshot {
          delete_after_days_since_creation_greater_than = rule.value.snapshot_days_after_creation_greater_than
        }
        version {
          delete_after_days_since_creation = rule.value.version_days_after_creation
        }
      }
    }
  }
}
