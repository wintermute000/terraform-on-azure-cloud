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
    key                  = "10-test.terraform.tfstate"
  }
}

# Provider Block
provider "azurerm" {
  features {}
}


