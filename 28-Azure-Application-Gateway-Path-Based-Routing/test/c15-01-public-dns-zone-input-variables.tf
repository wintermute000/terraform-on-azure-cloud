# Input Variables Placeholder file
# Input Variables Place holder file
variable "public_dns_zone" {
  description = "Public DNS Zone"
  type        = string
  default     = "mctesty.online"
}

variable "tm_dns_record" {
  description = "Traffic Manager DNS Record"
  type        = string
  default     = "mytfdemo"
}