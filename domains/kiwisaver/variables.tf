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

# topic related variables
variable "topics" {
  description = "List of kafka topic(s) for a cluster"
  type = list(object({
    name = string
    partitions_count = number
    cleanup_policy = string
  }))
}