variable "environment" {
  description = "Name of environment"
  type        = string
}

variable "cluster_name" {
  description = "Name of a cluster"
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

# service account related variables
variable "service_accounts" {
  description = "List of service accounts(s) for a cluster"
  type = list(object({
    name = string
    description = string
  }))
}

variable "api_keys" {
  description = "List of api key(s) for a cluster"
  type = list(object({
    name = string
    description = string
    service_account_id = string
    cluster_id = string
  }))
}