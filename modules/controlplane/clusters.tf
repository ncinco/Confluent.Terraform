resource "confluent_environment" "prod" {
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
  basic {}

  environment {
    id = confluent_environment.prod.id
  }

  lifecycle {
    prevent_destroy = true
  }
}