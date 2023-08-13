terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

resource "confluent_environment" "environment" {
  display_name = "${var.environment}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "confluent_kafka_cluster" "kafka_cluster" {
  display_name = var.cluster_name
  availability = "SINGLE_ZONE"
  cloud        = var.cluster_cloud
  region       = var.cluster_region
  standard {}

  environment {
    id = confluent_environment.environment.id
  }

  lifecycle {
    prevent_destroy = true
  }
}
