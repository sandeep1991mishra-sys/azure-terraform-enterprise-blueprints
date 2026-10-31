variable "databases" {
  description = "Azure SQL databases keyed by a caller-defined instance key."
  type = map(object({
    name      = string
    server_id = string
    sku_name  = optional(string, "GP_S_Gen5_2")
    max_size_gb = optional(number)
    zone_redundant = optional(bool, false)
    tags      = optional(map(string), {})
  }))
  default = {}
}
