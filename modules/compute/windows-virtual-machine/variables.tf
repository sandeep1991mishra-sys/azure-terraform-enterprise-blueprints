variable "resources" {
  description = "Resource configurations for the windows-virtual-machine module."
  type = map(object({
  name                  = string
  resource_group_name   = string
  location              = string
  size                  = optional(string, "Standard_B2s")
  admin_username        = string
  admin_password        = string
  network_interface_ids = list(string)
  tags                  = optional(map(string), {})
  }))
  default = {}
}
