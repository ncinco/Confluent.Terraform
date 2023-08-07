terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

resource "confluent_kafka_topic" "kafka_topics" {
  for_each           = { for topic in var.topics : topic.name => topic }
  
  kafka_cluster {
    id = var.cluster_id
  }
  topic_name         = each.value.name
  partitions_count   = each.value.partitions_count
  rest_endpoint      = var.rest_endpoint
  credentials {
    key              = var.app_manager_api_key
    secret           = var.app_manager_api_secret
  }
  config = {
    "cleanup.policy" = each.value.cleanup_policy
  }

  lifecycle {
    prevent_destroy  = true
  }
}