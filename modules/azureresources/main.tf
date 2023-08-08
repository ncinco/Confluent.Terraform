terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }
}

data "azurerm_client_config" "current" {
}

resource "azurerm_resource_group" "confluent_state" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_key_vault" "confluent_cloud_key_vault" {
  name                        = var.key_vault_name
  location                    = var.resource_group_location
  resource_group_name         = var.resource_group_name
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

resource "azurerm_role_assignment" "service-principal-role-assignment" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azuread_group.object_id
}