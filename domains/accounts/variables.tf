# cluster related variables
variable "cluster_name" {
  description = "Name of a cluster"
  type        = string
  default     = "bank_accounts_cluster"
}

variable "environment" {
  description = "Name of environment"
  type        = string
  default     = "accounts_prod"
}

variable "cluster_cloud" {
  description = "Cloud provider of a cluster"
  type        = string
  default     = "AZURE"
}

variable "cluster_region" {
  description = "Region of a cluster"
  type        = string
  default     = "australiaeast"
}

# topic related variables
variable "topics" {
  description = "List of kafka topic(s) for a cluster"
  type = list(object({
    name = string
    partitions_count = number
    cleanup_policy = string
  }))
  default = [
    { name = "accounts", partitions_count = 8, cleanup_policy = "delete"},
    { name = "transactions", partitions_count = 7, cleanup_policy = "delete"},
    { name = "superman", partitions_count = 7, cleanup_policy = "delete"}
  ]
}