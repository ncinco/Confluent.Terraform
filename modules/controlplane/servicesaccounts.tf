resource "confluent_service_account" "app-manager" {
  display_name = "${var.cluster_name}-app-manager"
  description  = "Service Account for ${var.cluster_name} cluster"
}

resource "confluent_role_binding" "app-manager-kafka-cluster-admin" {
  principal   = "User:${confluent_service_account.app-manager.id}"
  role_name   = "CloudClusterAdmin"
  crn_pattern = confluent_kafka_cluster.kafka_cluster.rbac_crn
}