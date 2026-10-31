variable "resources" {
  description = "Resource configurations for the disk-attachment module."
  type = map(object({
    managed_disk_id    = string
    virtual_machine_id = string
    lun                = number
    caching            = optional(string, "ReadWrite")
  }))
  default = {}
}
