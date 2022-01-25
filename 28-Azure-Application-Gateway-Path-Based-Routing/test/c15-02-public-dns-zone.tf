# Datasource: Get DNS Record
data "azurerm_dns_zone" "dns_zone" {
  name                = var.public_dns_zone
  resource_group_name = "loj-DNS"
}


# Resource-3: Add app1 Record Set in DNS Zone
resource "azurerm_dns_a_record" "dns_record_appgw" {
  depends_on          = [azurerm_application_gateway.web_ag]
  name                = var.tm_dns_record
  zone_name           = data.azurerm_dns_zone.dns_zone.name
  resource_group_name = data.azurerm_dns_zone.dns_zone.resource_group_name
  ttl                 = 300
  target_resource_id = azurerm_public_ip.web_ag_publicip.id
  
}
