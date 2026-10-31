variable "contacts" {
  description = "Microsoft Defender for Cloud security contacts."

  type = map(object({
    name                = string
    email               = string
    phone               = optional(string)
    alert_notifications = optional(bool, true)
    alerts_to_admins    = optional(bool, true)
  }))

  default = {}
}
