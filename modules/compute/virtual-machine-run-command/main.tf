resource "azurerm_virtual_machine_run_command" "resource" {
  for_each = var.resources

  name               = each.value.name
  location           = each.value.location
  virtual_machine_id = each.value.virtual_machine_id

  source {
    script = each.value.source_script
  }
}
