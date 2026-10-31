variable "resources" {
  description = "Resource configurations for the virtual-machine-run-command module."
  type = map(object({
  name               = string
  location           = string
  virtual_machine_id = string
  source_script      = string
  }))
  default = {}
}
