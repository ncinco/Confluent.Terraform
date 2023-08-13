terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

resource "confluent_service_account" "service-accounts" {
  for_each     = { for service_account in var.service_accounts : service_account.name => service_account }

  display_name = each.value.name
  description  = each.value.description
}

resource "confluent_role_binding" "role-bindings" {
  for_each     = { for role_binding in var.role_bindings : role_binding.principal => role_binding }

  principal   = each.value.principal
  role_name   = each.value.role_name
  crn_pattern = each.value.crn_pattern
}

resource "terraform_data" "confluent_api_key" {
  for_each      = { for api_key in var.api_keys : api_key.name => api_key }

  provisioner "local-exec" {
    working_dir = path.module
    command     = "python3 ./createApiKey.py"
    environment = {
      app_manager_api_key       = var.app_manager_api_key
      app_manager_api_secret    = var.app_manager_api_secret

      display_name              = each.value.name
      description               = each.value.description
      owner_id                  = each.value.service_account_id
      resource_id               = each.value.cluster_id

      # service principal related variables
      azure_subscription_id      = var.azure_subscription_id
      azure_client_id            = var.azure_client_id
      azure_tenant_id            = var.azure_tenant_id
      azure_client_secret        = var.azure_client_secret

      // make sure we do not print the token in terraform command prompt output
      quiet = true
    }
  }
}
