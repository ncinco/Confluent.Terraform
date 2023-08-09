# resource "confluent_api_key" "app-manager-kafka-api-key" {
#   display_name = "Cluster: ${var.cluster_name} App Manager API Key"
#   description  = "Kafka API Key that is owned by '${var.cluster_name}-app-manager' service account"
#   owner {
#     id          = confluent_service_account.app-manager.id
#     api_version = confluent_service_account.app-manager.api_version
#     kind        = confluent_service_account.app-manager.kind
#   }

#   managed_resource {
#     id          = confluent_kafka_cluster.kafka_cluster.id
#     api_version = confluent_kafka_cluster.kafka_cluster.api_version
#     kind        = confluent_kafka_cluster.kafka_cluster.kind

#     environment {
#       id = confluent_environment.prod.id
#     }
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }