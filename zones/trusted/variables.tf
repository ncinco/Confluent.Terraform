# cluster related variables
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








# azure resources
variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "resource_group_location" {
  description = "Location of resource group"
  type        = string
}

variable "key_vault_name" {
  description = "Key Vault name"
  type        = string
}

variable "key_vault_sku_name" {
  description = "SKU name"
  type        = string
}

variable "key_vault_soft_delete_retention_days" {
  description = "Soft delete retention days."
  type        = string
}