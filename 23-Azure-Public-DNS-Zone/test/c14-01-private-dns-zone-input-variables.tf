# Input Variables Place holder file
variable "private_dns_zone" {
  description = "Private DNS Zone"
  type        = string
  default     = "mctesty.online"
}

# Input Variables Place holder file
variable "app_lb_dns_record" {
  description = "App Load Balancer DNS Record"
  type        = string
  default     = "applb"
}