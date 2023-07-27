terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.50.0"
    }
  }

backend "azurerm" {
    resource_group_name  = "Terraform_State"
    storage_account_name = "confluentstate"
    container_name       = "dev"
    key                  = "confluentstate.tfstate"
  }
}

provider "confluent" {
  # cloud_api_key    = var.confluent_cloud_api_key
  # cloud_api_secret = var.confluent_cloud_api_secret
}
