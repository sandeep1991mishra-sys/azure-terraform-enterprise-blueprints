variable "resources" {
  description = "Resource configurations for the shared-image-gallery module."
  type = map(object({
  name                = string
  resource_group_name = string
  location            = string
  description         = optional(string, "Reusable Azure Compute Gallery")
  tags                = optional(map(string), {})
  }))
  default = {}
}
