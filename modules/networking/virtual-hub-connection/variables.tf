variable "resources" {
  description = "Map of Azure Virtual Hub connection configurations."

  type = map(object({
    name                      = string
    virtual_hub_id            = string
    remote_virtual_network_id = string

    internet_security_enabled = optional(bool)

    routing = optional(object({
      associated_route_table_id                   = optional(string)
      inbound_route_map_id                        = optional(string)
      outbound_route_map_id                       = optional(string)
      static_vnet_propagate_static_routes_enabled = optional(bool)
    }))
  }))

  default = {}
}