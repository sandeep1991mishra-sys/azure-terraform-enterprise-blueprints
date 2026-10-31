variable "vaults" {
  description = "Recovery Services Vaults keyed by a caller-defined instance key."

  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = optional(string, "Standard")
    tags                = optional(map(string), {})
  }))

  default = {}
}
