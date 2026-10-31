variable "resources" {
  description = "Configurations for the virtual-hub module."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    virtual_wan_id      = string
    address_prefix      = string
    sku                 = optional(string, "Standard")
    tags                = optional(map(string), {})
  }))
  default = {}
}
