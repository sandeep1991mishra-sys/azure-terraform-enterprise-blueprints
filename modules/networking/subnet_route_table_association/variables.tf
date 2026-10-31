variable "subnet_route_table_associations" {
  description = "Map of subnet and route table associations."

  type = map(object({
    subnet_id      = string
    route_table_id = string
  }))

  nullable = false
}