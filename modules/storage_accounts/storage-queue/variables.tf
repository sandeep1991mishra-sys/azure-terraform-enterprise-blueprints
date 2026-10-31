variable "queues" {
  description = "Storage queues keyed by a caller-defined instance key."
  type = map(object({
    name                 = string
    storage_account_name = string
    metadata             = optional(map(string), {})
  }))
  default = {}
}
