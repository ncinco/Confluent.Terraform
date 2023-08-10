terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Terraform_State"
    storage_account_name = "confluentstate"
    container_name       = "azureresources"
    key                  = "azureresources.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {
}

# resource group
resource "azurerm_resource_group" "confluent_state_resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

# key vault
resource "azurerm_key_vault" "confluent_cloud_key_vault" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.confluent_state_resource_group.location
  resource_group_name         = azurerm_resource_group.confluent_state_resource_group.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.key_vault_soft_delete_retention_days
  purge_protection_enabled    = false
  sku_name                    = var.key_vault_sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}

# add github runner service principal as kv admin
resource "azurerm_role_assignment" "akv_sp" {
  scope                = azurerm_key_vault.confluent_cloud_key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}
