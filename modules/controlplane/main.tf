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
      ARM_SUBSCRIPTION_ID        = var.ARM_SUBSCRIPTION_ID
      ARM_TENANT_ID              = var.ARM_TENANT_ID
      ARM_CLIENT_ID              = var.ARM_CLIENT_ID
      ARM_CLIENT_SECRET          = var.ARM_CLIENT_SECRET

      // make sure we do not print the token in terraform command prompt output
      quiet = true
    }
  }
}