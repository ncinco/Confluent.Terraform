variable "environment_id" {
  description = "Id of environment"
  type        = string
}

# cluster related variables
variable "cluster_id" {
  description = "Id of a cluster"
  type        = string
}

variable "rest_endpoint" {
  description = "Cluster's rest endpoint"
  type        = string
}

variable "app_manager_api_key" {
  description = "Application Manager Key"
  type        = string
  sensitive   = true
}

variable "app_manager_api_secret" {
  description = "Application Manager Secret"
  type        = string
  sensitive   = true
}

# topic related variables
variable "topics" {
  description = "List of kafka topic(s) for a cluster"
  type = list(object({
    name             = string
    partitions_count = number
    cleanup_policy   = string
  }))
}