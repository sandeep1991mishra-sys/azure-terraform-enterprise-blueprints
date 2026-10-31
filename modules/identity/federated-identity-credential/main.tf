resource "azurerm_federated_identity_credential" "this" {
  for_each = var.credentials
  name     = each.value.name
  parent_id = each.value.parent_id
  audience = each.value.audience
  issuer   = each.value.issuer
  subject  = each.value.subject
}
