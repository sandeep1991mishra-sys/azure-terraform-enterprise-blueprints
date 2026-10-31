variable "resources" {
  description = "Resource configurations for the gallery-image-definition module."
  type = map(object({
  name                = string
  gallery_name        = string
  resource_group_name = string
  location            = string
  os_type             = string
  identifier_publisher = string
  identifier_offer     = string
  identifier_sku       = string
  tags                = optional(map(string), {})
  }))
  default = {}
}
