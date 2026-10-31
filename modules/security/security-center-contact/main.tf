resource "azurerm_security_center_contact" "this" {
  for_each            = var.contacts
  name                = each.value.name
  email               = each.value.email
  phone               = each.value.phone
  alert_notifications = each.value.alert_notifications
  alerts_to_admins    = each.value.alerts_to_admins
}
