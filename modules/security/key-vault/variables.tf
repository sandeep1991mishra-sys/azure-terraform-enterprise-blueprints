variable "vaults" {
  description = "Key Vaults keyed by a caller-defined instance key."
  type = map(object({
    name                          = string
    resource_group_name           = string
    location                      = string
    tenant_id                     = string
    sku_name                      = optional(string, "standard")
    soft_delete_retention_days    = optional(number, 90)
    purge_protection_enabled      = optional(bool, true)
    public_network_access_enabled = optional(bool, false)
    tags                          = optional(map(string), {})
  }))
  default = {}
}
