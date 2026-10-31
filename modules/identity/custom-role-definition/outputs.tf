output "ids" { value = { for k, v in azurerm_role_definition.this : k => v.role_definition_resource_id } }
