resource "confluent_kafka_topic" "bank_transactions" {
  kafka_cluster {
    id = confluent_kafka_cluster.basic-cluster.id
  }
  topic_name         = "bank_transactions"
  rest_endpoint      = confluent_kafka_cluster.basic-cluster.rest_endpoint
  credentials {
    key    = confluent_api_key.basic_kafka_cluster-app-manage-kafka-api-key.id
    secret = confluent_api_key.basic_kafka_cluster-app-manage-kafka-api-key.secret
  }

  lifecycle {
    prevent_destroy = true
  }
}
