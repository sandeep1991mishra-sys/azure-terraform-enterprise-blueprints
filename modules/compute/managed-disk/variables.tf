variable "resources" {
  description = "Resource configurations for the managed-disk module."
  type = map(object({
  name                 = string
  resource_group_name  = string
  location             = string
  storage_account_type = optional(string, "Standard_LRS")
  create_option        = optional(string, "Empty")
  disk_size_gb         = number
  tags                 = optional(map(string), {})
  }))
  default = {}
}
