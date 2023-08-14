# confluent related variables
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

# service account related variables
variable "service_accounts" {
  description = "List of service accounts(s) for a cluster"
  type = list(object({
    name = string
    description = string
  }))
}

variable "role_bindings" {
  description = "User role bindings"
  type = list(object({
    principal = string
    role_name = string
    crn_pattern = string
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

variable "acls" {
  description = "Access control list"
  type = list(object({
    name = string
    description = string
    resource_type = string
    resource_name = string
    principal = string
    host = string
    operation = string
    permission = string
    rest_endpoint = string
  }))
}

# Service Principal Variables
variable "azure_subscription_id" {
  type        = string
  description = "Service Principal Subscription ID"
}

variable "azure_tenant_id" {
  type        = string
  description = "Service Principal Tenant ID"
}

variable "azure_client_id" {
  type        = string
  description = "Service Principal Client ID"
}

variable "azure_client_secret" {
  type        = string
  description = "Service Principal Secret"
}