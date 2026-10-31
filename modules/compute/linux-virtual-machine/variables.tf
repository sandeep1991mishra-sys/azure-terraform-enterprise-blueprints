variable "resources" {
  description = "Resource configurations for the linux-virtual-machine module."
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    size                            = optional(string, "Standard_B1s")
    admin_username                  = string
    network_interface_ids           = list(string)
    admin_password                  = optional(string)
    admin_ssh_key_username          = optional(string)
    admin_ssh_public_key            = optional(string)
    disable_password_authentication = optional(bool, true)
    tags                            = optional(map(string), {})
  }))
  default = {}
}
