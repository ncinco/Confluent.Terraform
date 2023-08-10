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
  service_accounts           = var.service_accounts
  api_keys                   = var.api_keys
}
