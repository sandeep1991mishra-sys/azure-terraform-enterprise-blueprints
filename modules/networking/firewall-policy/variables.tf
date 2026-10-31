variable "resources" {
  description = "Configurations for the firewall-policy module."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard")
    tags                = optional(map(string), {})
  }))
  default = {}
}
