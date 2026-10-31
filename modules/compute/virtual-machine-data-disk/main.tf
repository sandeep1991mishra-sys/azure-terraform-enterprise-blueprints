resource "azurerm_virtual_machine_data_disk_attachment" "resource" {
  for_each = var.resources

  virtual_machine_id        = each.value.virtual_machine_id
  managed_disk_id           = each.value.managed_disk_id
  lun                       = each.value.lun
  caching                   = each.value.caching
  create_option             = each.value.create_option
  write_accelerator_enabled = each.value.write_accelerator_enabled
}
