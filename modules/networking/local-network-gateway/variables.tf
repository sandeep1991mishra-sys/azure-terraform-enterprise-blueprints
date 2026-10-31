variable "resources" {
  description = "Configurations for the local-network-gateway module."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    gateway_address     = string
    address_space       = list(string)
    tags                = optional(map(string), {})
  }))
  default = {}
}
