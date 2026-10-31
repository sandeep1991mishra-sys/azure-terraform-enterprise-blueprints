variable "resources" {
  description = "Configurations for the private-endpoint module."
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    subnet_id                      = string
    connection_name                = string
    private_connection_resource_id = string
    is_manual_connection           = optional(bool, false)
    subresource_names              = list(string)
    tags                           = optional(map(string), {})
  }))
  default = {}
}
