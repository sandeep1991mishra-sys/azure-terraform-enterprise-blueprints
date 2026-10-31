variable "resources" {
  description = "Resource configurations for the capacity reservation"
  type = map(object({
    name                          = string
    capacity_reservation_group_id = string
    sku = object({
      name     = string
      capacity = number
    })
    tags = optional(map(string), {})
  }))
  default = {}
}