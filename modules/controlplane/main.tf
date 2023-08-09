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

resource "confluent_api_key" "app-manager-kafka-api-key" {
  for_each     = { for api_key in var.api_keys : api_key.name => api_key }

  display_name = "Cluster: ${var.cluster_name} Service Account: ${each.value.name}' API Key"
  description  = "Kafka API Key that is owned by '${var.cluster_name}-app-manager' service account"
  owner {
    id          = confluent_service_account.app-manager.id
    api_version = confluent_service_account.app-manager.api_version
    kind        = confluent_service_account.app-manager.kind
  }

  managed_resource {
    id          = confluent_kafka_cluster.kafka_cluster.id
    api_version = confluent_kafka_cluster.kafka_cluster.api_version
    kind        = confluent_kafka_cluster.kafka_cluster.kind

    environment {
      id = confluent_environment.prod.id
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}