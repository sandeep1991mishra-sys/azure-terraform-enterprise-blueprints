
output "ids" {
  description = "IDs of the managed virtual networks."

  value = {
    for key, virtual_network in azurerm_virtual_network.virtual_networks :
    key => virtual_network.id
  }
}

output "names" {
  description = "Names of the managed virtual networks."

  value = {
    for key, virtual_network in azurerm_virtual_network.virtual_networks :
    key => virtual_network.name
  }
}

output "address_spaces" {
  description = "Address spaces of the managed virtual networks."

  value = {
    for key, virtual_network in azurerm_virtual_network.virtual_networks :
    key => virtual_network.address_space
  }
}

output "resource_group_names" {
  description = "Resource groups containing the virtual networks."

  value = {
    for key, virtual_network in azurerm_virtual_network.virtual_networks :
    key => virtual_network.resource_group_name
  }
}
