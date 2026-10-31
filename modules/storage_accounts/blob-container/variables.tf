variable "containers" {
  description = "Blob containers keyed by a caller-defined instance key."

  type = map(object({
    name                  = string
    storage_account_id    = string
    container_access_type = optional(string, "private")
    metadata              = optional(map(string), {})
  }))

  default = {}
}
