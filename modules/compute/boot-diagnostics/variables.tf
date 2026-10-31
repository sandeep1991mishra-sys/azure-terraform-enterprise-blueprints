
variable "resources" {
  description = "Linux VMs with boot diagnostics enabled."

  type = map(object({
    name                              = string
    resource_group_name               = string
    location                          = string
    size                              = string
    admin_username                    = string
    network_interface_ids             = list(string)
    admin_ssh_public_key              = string
    boot_diagnostics_storage_account_uri = optional(string)
    tags                              = optional(map(string), {})
  }))

  default = {}
}
