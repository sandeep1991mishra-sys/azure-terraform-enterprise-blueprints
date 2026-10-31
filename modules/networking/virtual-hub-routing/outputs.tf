output "ids" {
  description = "Map of Virtual Hub route table resource IDs."
  value = {
    for key, resource in azurerm_virtual_hub_route_table.resource :
    key => resource.id
  }
}

output "names" {
  description = "Map of Virtual Hub route table names."
  value = {
    for key, resource in azurerm_virtual_hub_route_table.resource :
    key => resource.name
  }
}
