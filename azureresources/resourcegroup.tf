resource "azurerm_resource_group" "confluent_state_resource_group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_role_assignment" "resource_group_role_assingment" {
  scope                = azurerm_resource_group.confluent_state_resource_group.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.current.object_id
}
