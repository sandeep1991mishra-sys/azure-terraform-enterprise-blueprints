variable "resources" {
  description = "Map of Azure Virtual Hub route table configurations."

  type = map(object({
    name           = string
    virtual_hub_id = string

    labels = optional(set(string), [])

    routes = optional(list(object({
      name              = string
      destinations      = set(string)
      destinations_type = string
      next_hop          = string
      next_hop_type     = optional(string)
    })), [])
  }))

  default = {}
}
