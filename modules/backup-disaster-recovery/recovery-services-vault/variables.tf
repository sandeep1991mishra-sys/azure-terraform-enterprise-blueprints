variable "vaults" {
  description = "Recovery Services Vaults keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard")
    soft_delete_enabled = optional(bool, true)
    tags                = optional(map(string), {})
  }))
  default = {}
}
