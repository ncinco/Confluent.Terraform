terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

data "confluent_schema_registry_region" "schema_registry_region" {
  cloud   = var.registry_region.cloud
  region  = var.registry_region.region
  package = var.registry_region.package
}

resource "confluent_schema_registry_cluster" "schema_registry_cluster" {
  package = var.registry_region.package

  environment {
    id = var.registry_region.environment_id
  }

  region {
    # See https://docs.confluent.io/cloud/current/stream-governance/packages.html#stream-governance-regions
    # Schema Registry and Kafka clusters can be in different regions as well as different cloud providers,
    # but you should to place both in the same cloud and region to restrict the fault isolation boundary.
    id = data.confluent_schema_registry_region.schema_registry_region.id
  }

  lifecycle {
    prevent_destroy = true
  }
}