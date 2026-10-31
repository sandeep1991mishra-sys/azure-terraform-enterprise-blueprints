variable "secrets" {
  description = "Key Vault secrets keyed by a caller-defined instance key."
  type = map(object({
    name         = string
    value        = string
    key_vault_id = string
    content_type = optional(string)
    not_before_date = optional(string)
    expiration_date = optional(string)
  }))
  sensitive = true
  default = {}
}
