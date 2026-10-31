variable "policies" {
  description = "Storage lifecycle policies keyed by a caller-defined instance key."
  type = map(object({
    storage_account_id = string
    rules = list(object({
      name    = string
      enabled = bool
      prefix_match = list(string)
      blob_types = list(string)
      base_blob_days_after_modification_greater_than = optional(number)
      snapshot_days_after_creation_greater_than = optional(number)
      version_days_after_creation = optional(number)
    }))
  }))
  default = {}
}
