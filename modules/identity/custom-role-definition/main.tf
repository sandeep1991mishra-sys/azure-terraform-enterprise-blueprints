resource "azurerm_role_definition" "this" {
  for_each    = var.roles
  name        = each.value.role_name
  scope       = each.value.scope
  description = each.value.description
  dynamic "permissions" {
    for_each = each.value.permissions
    content {
      actions          = permissions.value.actions
      not_actions      = permissions.value.not_actions
      data_actions     = permissions.value.data_actions
      not_data_actions = permissions.value.not_data_actions
    }
  }
  assignable_scopes = each.value.assignable_scopes
}
