resource "azurerm_federated_identity_credential" "this" {
  for_each                  = var.credentials
  name                      = each.value.name
  user_assigned_identity_id = each.value.user_assigned_identity_id
  audience                  = each.value.audience
  issuer                    = each.value.issuer
  subject                   = each.value.subject
}
