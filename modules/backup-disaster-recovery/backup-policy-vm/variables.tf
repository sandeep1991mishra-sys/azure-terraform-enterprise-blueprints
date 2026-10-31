variable "policies" {
  description = "VM backup policies keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    resource_group_name = string
    recovery_vault_name = string
    backup = object({
      frequency = string
      time      = string
    })
    retention_daily = object({ count = number })
  }))
  default = {}
}
