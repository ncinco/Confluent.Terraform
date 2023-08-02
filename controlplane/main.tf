terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

provider "confluent" {
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}

locals {
  topics_data = jsondecode(templatefile("./${path.module}/topics.tpl", {
    topics  = jsonencode(var.topics)
  }))
}

resource "confluent_kafka_topic" "kafka_topics" {
  for_each           = { for topic in local.topics_data.topics : topic.name => topic }
  
  kafka_cluster {
    id = confluent_kafka_cluster.kafka_cluster.id
  }
  topic_name         = each.value.name
  partitions_count   = each.value.partitions_count
  rest_endpoint      = confluent_kafka_cluster.kafka_cluster.rest_endpoint
  credentials {
    key    = confluent_api_key.app-manager-kafka-api-key.id
    secret = confluent_api_key.app-manager-kafka-api-key.secret
  }
  config = {
    "cleanup.policy"                      = "delete"
  }

  lifecycle {
    prevent_destroy  = true
  }
}