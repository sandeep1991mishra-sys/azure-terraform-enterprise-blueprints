output "ids" {
  description = "IDs of created resources."
  value       = { for key, resource in azurerm_shared_image_gallery.resource : key => resource.id }
}

output "names" {
  description = "Names of created resources."
  value       = { for key, resource in azurerm_shared_image_gallery.resource : key => resource.name }
}
