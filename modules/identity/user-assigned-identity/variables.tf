variable "identities" {
  description = "User-assigned managed identities keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    tags                = optional(map(string), {})
  }))
  default = {}
}
