variable "shares" {
  description = "Azure Files shares keyed by a caller-defined instance key."

  type = map(object({
    name               = string
    storage_account_id = string
    quota              = number
    access_tier        = optional(string)
    enabled_protocol   = optional(string, "SMB")
    metadata           = optional(map(string), {})
  }))

  default = {}
}
