# confluent secrets
variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key (also referred as Cloud API ID)"
  type        = string
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
  sensitive   = true
}

# cluster related variables
variable "cluster_name" {
  description = "Name of a cluster"
  type        = string
}

variable "environment" {
  description = "Name of environment"
  type        = string
}

variable "cluster_cloud" {
  description = "Cloud provider of a cluster"
  type        = string
}

variable "cluster_region" {
  description = "Region of a cluster"
  type        = string
}