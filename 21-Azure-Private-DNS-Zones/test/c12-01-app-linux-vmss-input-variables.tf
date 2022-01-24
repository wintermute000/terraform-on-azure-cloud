# Linux VM Input Variables Placeholder file.
variable "app_vmss_nsg_inbound_ports" {
  description = "App VMSS NSG Inbound Ports"
  type        = list(string)
  default     = [22, 80, 443]
}

variable "app_vmss_instance_count" {
  description = "App VMSS Instance Count"
  type        = number
  default     = 2
}
