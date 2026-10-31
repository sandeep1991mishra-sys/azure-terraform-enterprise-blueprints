variable "records" {
  description = "A records keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    records             = list(string)
    target_resource_id  = optional(string)
  }))
  default = {}
}
