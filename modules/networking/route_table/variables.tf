
variable "route_tables" {
  description = "Map of Azure route tables to create."

  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    bgp_route_propagation_enabled = optional(bool, true)
    tags                          = optional(map(string), {})
  }))

  nullable = false
}
