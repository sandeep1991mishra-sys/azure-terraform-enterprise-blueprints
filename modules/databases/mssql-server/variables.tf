variable "servers" {
  description = "Azure SQL logical servers keyed by a caller-defined instance key."
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = optional(string, "1.2")
    public_network_access_enabled = optional(bool, false)
    tags                         = optional(map(string), {})
  }))
  sensitive = false
  default = {}
}
