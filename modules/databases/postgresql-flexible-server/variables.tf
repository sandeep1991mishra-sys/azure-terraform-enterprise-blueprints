variable "servers" {
  description = "PostgreSQL Flexible Servers keyed by a caller-defined instance key."
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    version                       = string
    administrator_login           = string
    administrator_password        = string
    sku_name                      = string
    storage_mb                    = number
    backup_retention_days         = optional(number, 7)
    zone                          = optional(string)
    public_network_access_enabled = optional(bool, false)
    tags                          = optional(map(string), {})
  }))
  sensitive = false
  default   = {}
}
