variable "records" {
  description = "CNAME records keyed by a caller-defined instance key."
  type = map(object({
    name                = string
    zone_name           = string
    resource_group_name = string
    ttl                 = number
    record              = string
  }))
  default = {}
}
