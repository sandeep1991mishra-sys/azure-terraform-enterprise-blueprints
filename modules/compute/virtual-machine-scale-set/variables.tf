variable "resources" {
  description = "Resource configurations for the virtual-machine-scale-set module."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard_B1s")
    instances           = optional(number, 1)
    admin_username      = string
    subnet_id           = string
    tags                = optional(map(string), {})
  }))
  default = {}
}
