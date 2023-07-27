resource "confluent_service_account" "basic_kafka_cluster-app-manager" {
  display_name = "Application Manager"
  description  = "Service account to manage 'basic_kafka_cluster' Kafka cluster"
}

resource "confluent_api_key" "basic_kafka_cluster-app-manage-kafka-api-key" {
  display_name = "basic_kafka_cluster-app-manage-kafka-api-key"
  description  = "Kafka API Key that is owned by 'basic_kafka_cluster-app-manage' service account"
  owner {
    id          = confluent_service_account.basic_kafka_cluster-app-manager.id
    api_version = confluent_service_account.basic_kafka_cluster-app-manager.api_version
    kind        = confluent_service_account.basic_kafka_cluster-app-manager.kind
  }
}
