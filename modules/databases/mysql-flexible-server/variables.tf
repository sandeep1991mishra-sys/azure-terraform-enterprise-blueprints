variable "servers" {
  description = "MySQL Flexible Servers keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    administrator_login = string
    administrator_password = string
    sku_name            = string
    version             = string
    backup_retention_days = optional(number, 7)
    public_network_access = optional(bool, false)
    tags = optional(map(string), {})
  }))
  default = {}
}
