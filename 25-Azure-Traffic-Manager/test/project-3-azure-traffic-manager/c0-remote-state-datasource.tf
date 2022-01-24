# Project-1: East US2 Datasource
data "terraform_remote_state" "project1-australiaeast-test" {
  backend = "azurerm"
  config = {
    resource_group_name   = "loj-infra"
    storage_account_name  = "lojinfrastoracc"
    container_name        = "terraform-on-azure-cloud"
    key                   = "project1-australiaeast-test.terraform.tfstate"
  }
}

# Project-2: West US2 Datasource
data "terraform_remote_state" "project2-australiasoutheast-test" {
  backend = "azurerm"
  config = {
    resource_group_name   = "loj-infra"
    storage_account_name  = "lojinfrastoracc"
    container_name        = "terraform-on-azure-cloud"
    key                   = "project2-australiasoutheast-test.terraform.tfstate"
  }
}

/* 
1. Project-1: Web LB Public IP Address
data.terraform_remote_state.project1_eastus2.outputs.web_lb_public_ip_address_id
1. Project-2: Web LB Public IP Address
data.terraform_remote_state.project2_westus2.outputs.web_lb_public_ip_address_id
*/
