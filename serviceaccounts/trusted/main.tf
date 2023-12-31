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
    key                  = "serviceaccounts.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "controlplane" {
  source = "../../modules/serviceaccounts"

  # confluent related variables
  app_manager_api_key        = var.app_manager_api_key
  app_manager_api_secret     = var.app_manager_api_secret

  # service account related variables
  service_accounts           = var.service_accounts
  role_bindings              = var.role_bindings
  api_keys                   = var.api_keys
  acls                       = var.acls

  # service principal related variables
  azure_subscription_id      = var.azure_subscription_id
  azure_tenant_id            = var.azure_tenant_id
  azure_client_id            = var.azure_client_id
  azure_client_secret        = var.azure_client_secret
}