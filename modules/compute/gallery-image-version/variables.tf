variable "resources" {
  description = "Resource configurations for the gallery-image-version module."
  type = map(object({
    name                = string
    image_name          = string
    gallery_name        = string
    resource_group_name = string
    location            = string
    managed_image_id    = string
    target_regions      = list(string)
  }))
  default = {}
}
