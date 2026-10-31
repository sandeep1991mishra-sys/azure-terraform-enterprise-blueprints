variable "protected_vms" {
  description = "VM backup protection instances keyed by a caller-defined key."
  type = map(object({
    resource_group_name = string
    recovery_vault_name = string
    source_vm_id        = string
    backup_policy_id    = string
  }))
  default = {}
}
