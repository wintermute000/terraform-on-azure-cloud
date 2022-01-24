# Linux VM Input Variables Placeholder file.
variable "web_vmss_nsg_inbound_ports" {
  description = "Web VMSS NSG Inbound Ports"
  type        = list(string)
  default     = [22, 80, 443]
}

variable "web_vmss_instance_count" {
  description = "Web VMSS Instance Count"
  type        = number
  default     = 2
}
