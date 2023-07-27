resource "confluent_service_account" "basic_kafka_cluster-app-manager" {
  display_name = "Application Manager"
  description  = "Service account to manage 'basic_kafka_cluster' Kafka cluster"
}
