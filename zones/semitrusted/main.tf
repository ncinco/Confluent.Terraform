terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Terraform_State"
    storage_account_name = "astradbstate"
    container_name       = "dev"
    key                  = "semitrusted.tfstate"
  }
}

module "controlplane" {
  source = "../../modules/controlplane"
	
  # cluster related variables
  environment                = var.environment
  cluster_name               = var.cluster_name
  cluster_cloud              = var.cluster_cloud
  cluster_region             = var.cluster_region
}