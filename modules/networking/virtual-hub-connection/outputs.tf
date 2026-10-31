output "ids" {
  description = "Map of Virtual Hub connection resource IDs."

  value = {
    for key, resource in azurerm_virtual_hub_connection.resource :
    key => resource.id
  }
}

output "names" {
  description = "Map of Virtual Hub connection names."

  value = {
    for key, resource in azurerm_virtual_hub_connection.resource :
    key => resource.name
  }
}