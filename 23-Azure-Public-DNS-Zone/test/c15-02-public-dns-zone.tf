# Datasource: Get DNS Record
data "azurerm_dns_zone" "dns_zone" {
  name                = var.public_dns_zone
  resource_group_name = "loj-DNS"
}

# Resource-1: Add ROOT Record Set in DNS Zone
resource "azurerm_dns_a_record" "dns_record" {
  depends_on          = [azurerm_lb.web_lb]
  name                = "@"
  zone_name           = data.azurerm_dns_zone.dns_zone.name
  resource_group_name = data.azurerm_dns_zone.dns_zone.resource_group_name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.web_lbpublicip.id
}

# Resource-2: Add www Record Set in DNS Zone
resource "azurerm_dns_a_record" "dns_record_www" {
  depends_on          = [azurerm_lb.web_lb]
  name                = "www"
  zone_name           = data.azurerm_dns_zone.dns_zone.name
  resource_group_name = data.azurerm_dns_zone.dns_zone.resource_group_name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.web_lbpublicip.id
}

# Resource-3: Add app1 Record Set in DNS Zone
resource "azurerm_dns_a_record" "dns_record_app1" {
  depends_on          = [azurerm_lb.web_lb]
  name                = var.app_lb_dns_record
  zone_name           = data.azurerm_dns_zone.dns_zone.name
  resource_group_name = data.azurerm_dns_zone.dns_zone.resource_group_name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.web_lbpublicip.id
}
