output "ids" {
  description = "IDs of virtual machine data disk attachments."
  value       = { for key, resource in azurerm_virtual_machine_data_disk_attachment.resource : key => resource.id }
}
