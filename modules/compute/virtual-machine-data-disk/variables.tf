variable "resources" {
  description = "Resource configurations for the virtual-machine-data-disk module."
  type = map(object({
  name                 = string
  resource_group_name  = string
  location             = string
  disk_size_gb         = number
  storage_account_type = optional(string, "Standard_LRS")
  tags                 = optional(map(string), {})
  }))
  default = {}
}
