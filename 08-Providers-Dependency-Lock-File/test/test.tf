# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "loj-infra"
    storage_account_name = "lojinfrastoracc"
    container_name       = "terraform-on-azure-cloud"
    key                  = "08-test.terraform.tfstate"
  }

}

locals {
  tags = {
    "Name"               = "Johann Lo"
    "username"           = "loj"
    "ExpectedUseThrough" = "2023-04"
    "VMState"            = "ShutdownAtNight"
    "CostCenter"         = "790-5300"
    "Environment"        = "Terraform Lab"
  }
}

# Provider-1 for EastUS (Default Provider)
provider "azurerm" {
  features {}
}

# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "lojrg1" {
  name     = "lojrg-1"
  location = "australiasoutheast"
}

# Resource-2: Random String 
resource "random_string" "myrandom" {
  length  = 16
  upper   = false
  special = false
}

# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.lojrg1.name
  location                 = azurerm_resource_group.lojrg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags                     = local.tags
}