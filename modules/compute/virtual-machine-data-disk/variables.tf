variable "resources" {
  description = "Map of existing managed disks to attach to virtual machines."
  type = map(object({
    virtual_machine_id     = string
    managed_disk_id        = string
    lun                    = number
    caching                = optional(string, "ReadWrite")
    create_option          = optional(string, "Attach")
    write_accelerator_enabled = optional(bool, false)
  }))
  default = {}
}
