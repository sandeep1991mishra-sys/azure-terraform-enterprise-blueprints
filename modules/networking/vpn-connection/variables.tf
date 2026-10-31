variable "resources" {
  description = "Virtual network gateway connection configurations."

  type = map(object({
    name                            = string
    location                        = string
    resource_group_name             = string
    type                            = string
    virtual_network_gateway_id      = string
    peer_virtual_network_gateway_id = string
    shared_key                      = string
    connection_protocol             = optional(string, "IKEv2")
    tags                            = optional(map(string), {})
  }))

  sensitive = true
  default   = {}
}
