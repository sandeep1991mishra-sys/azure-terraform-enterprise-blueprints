variable "resources" {
  description = "Resource configurations for the virtual-machine-extension module."
  type = map(object({
  name                 = string
  virtual_machine_id   = string
  publisher            = string
  type                 = string
  type_handler_version = string
  settings             = optional(string, "{}")
  tags                 = optional(map(string), {})
  }))
  default = {}
}
