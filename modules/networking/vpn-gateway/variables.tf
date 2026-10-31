variable "resources" {
  description = "Configurations for the vpn-gateway module."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    virtual_hub_id      = string
    tags                = optional(map(string), {})
  }))
  default = {}
}
