# Define Local Values in Terraform
locals {
  owners               = var.business_divsion
  environment          = var.environment
  resource_name_prefix = "loj-${var.business_divsion}-${var.environment}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners               = local.owners
    environment          = local.environment
    "Name"               = "Johann Lo"
    "username"           = "loj"
    "ExpectedUseThrough" = "2023-04"
    "VMState"            = "ShutdownAtNight"
    "CostCenter"         = "790-5300"
    "Environment"        = "Terraform Lab"
  }
} 