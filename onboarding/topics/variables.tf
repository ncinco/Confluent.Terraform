variable "environment" {
  description = "Name of environment"
  type        = string
}

# cluster related variables
variable "cluster_name" {
  description = "Name of a cluster"
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