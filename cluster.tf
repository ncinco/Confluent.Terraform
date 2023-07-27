resource "confluent_environment" "development" {
  display_name = "Development"
}

resource "confluent_kafka_cluster" "basic-cluster" {
  display_name = "basic-cluster"
  availability = "SINGLE_ZONE"
  cloud        = "GCP"
  region       = "us-central1"
  standard {}

  environment {
    id = confluent_environment.development.id
  }

  lifecycle {
    prevent_destroy = true
  }
}
