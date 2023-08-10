terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "confluent_resource_group"
    storage_account_name = "confluentstate"
    container_name       = "trusted"
    key                  = "control_plane.tfstate"
  }
}

provider "azurerm" {
  features {}

  use_msi = true
}

module "azureresources" {
  source = "../../modules/azureresources"
	
  resource_group_name                  = var.resource_group_name
  resource_group_location              = var.resource_group_location
  
  key_vault_name                       = var.key_vault_name
  key_vault_sku_name                   = var.key_vault_sku_name
  key_vault_soft_delete_retention_days = var.key_vault_soft_delete_retention_days
}

module "controlplane" {
  source = "../../modules/controlplane"
	
  # cluster related variables
  environment                = var.environment
  cluster_name               = var.cluster_name
  cluster_cloud              = var.cluster_cloud
  cluster_region             = var.cluster_region

  # service account related variables
  service_accounts           = var.service_accounts
  api_keys                   = var.api_keys
}
