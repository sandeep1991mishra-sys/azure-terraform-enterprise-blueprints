variable "resources" {
  description = "Linux VMs configured for automatic guest patching."

  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    size                  = string
    admin_username        = string
    network_interface_ids = list(string)
    admin_ssh_public_key  = string
    tags                  = optional(map(string), {})
  }))

  default = {}
}

