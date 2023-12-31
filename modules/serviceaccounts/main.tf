terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

resource "confluent_service_account" "service-accounts" {
  for_each      = { for service_account in var.service_accounts : service_account.request_id => service_account }

  display_name  = each.value.name
  description   = each.value.description
}

resource "confluent_role_binding" "role-bindings" {
  for_each      = { for role_binding in var.role_bindings : role_binding.request_id => role_binding }

  principal     = each.value.principal
  role_name     = each.value.role_name
  crn_pattern   = each.value.crn_pattern
}

resource "terraform_data" "confluent_api_key" {
  for_each      = { for api_key in var.api_keys : api_key.request_id => api_key }

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

resource "confluent_kafka_acl" "acls" {
  for_each      = { for acl in var.acls : acl.request_id => acl }

  kafka_cluster {
    id          = each.value.kafka_cluster_id
  }

  resource_type = each.value.resource_type
  resource_name = each.value.resource_name
  pattern_type  = "LITERAL"
  principal     = each.value.principal
  host          = each.value.host
  operation     = each.value.operation
  permission    = each.value.permission
  rest_endpoint = each.value.rest_endpoint

  credentials {
    key         = var.app_manager_api_key
    secret      = var.app_manager_api_secret
  }

  lifecycle {
    prevent_destroy = true
  }
}