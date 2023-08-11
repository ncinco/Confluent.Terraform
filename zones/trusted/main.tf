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
    resource_group_name  = "Terraform_State"
    storage_account_name = "confluentstate"
    container_name       = "trusted"
    key                  = "cluster.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "controlplane" {
  source = "../../modules/controlplane"
	
  # cluster related variables
  environment                = var.environment
  cluster_name               = var.cluster_name
  cluster_cloud              = var.cluster_cloud
  cluster_region             = var.cluster_region

  # service account related variables
  app_manager_api_key        = var.app_manager_api_key
  app_manager_api_secret     = var.app_manager_api_secret

  service_accounts           = var.service_accounts
  api_keys                   = var.api_keys

  # service principal related variables
  ARM_SUBSCRIPTION_ID        = var.ARM_SUBSCRIPTION_ID
  ARM_TENANT_ID              = var.ARM_TENANT_ID
  ARM_CLIENT_ID              = var.ARM_CLIENT_ID
  ARM_CLIENT_SECRET          = var.ARM_CLIENT_SECRET
}
