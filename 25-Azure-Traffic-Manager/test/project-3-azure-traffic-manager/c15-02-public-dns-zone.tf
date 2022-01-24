# Datasource: Get DNS Record
data "azurerm_dns_zone" "dns_zone" {
  name                = var.public_dns_zone
  resource_group_name = "loj-DNS"
}


# Resource-3: Add app1 Record Set in DNS Zone
resource "azurerm_dns_cname_record" "dns_record_traffimanager" {
  depends_on          = [azurerm_traffic_manager_profile.tm_profile]
  name                = var.tm_dns_record
  zone_name           = data.azurerm_dns_zone.dns_zone.name
  resource_group_name = data.azurerm_dns_zone.dns_zone.resource_group_name
  ttl                 = 300
  record  = "${lookup(azurerm_traffic_manager_profile.tm_profile.dns_config[0], "relative_name", "mytfdemo")}.trafficmanager.net"
}
