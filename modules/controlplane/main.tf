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
  provisioner "local-exec" {

    working_dir = path.module
    command     = "python3 ./createApiKey.py"
    environment = {
      // make sure we do not print the token in terraform command prompt output
      quiet = false
    }
  }
}