variable "vaults" {
  description = "Data Protection Backup Vaults keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    datastore_type      = string
    redundancy          = string
    tags                = optional(map(string), {})
  }))
  default = {}
}
