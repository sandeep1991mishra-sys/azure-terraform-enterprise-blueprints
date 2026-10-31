variable "resources" {
  description = "Configurations for the front-door module."
  type = map(object({
    name                = string
    resource_group_name = string
    sku_name            = optional(string, "Standard_AzureFrontDoor")
    tags                = optional(map(string), {})
  }))
  default = {}
}
