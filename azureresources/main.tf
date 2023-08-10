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

# add github runner service principal as kv admin
resource "azurerm_role_assignment" "akv_sp" {
  scope                = azurerm_resource_group.confluent_state_resource_group.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "akv_sp" {
  scope                = azurerm_key_vault.confluent_cloud_key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}
