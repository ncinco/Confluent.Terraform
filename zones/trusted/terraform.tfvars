# cluster related variables
environment = "trusted"
cluster_name = "trusted"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"
service_accounts = [
    { name = "trusted.sa.cloud-cluster-admin", description = "CloudClusterAdmin service account for Trusted cluster."},
    { name = "trusted.sa.operator", description = "Operator service account for Trusted cluster."}
]

# azure resources
resource_group_name = "confluent_resource_group"
resource_group_location = "East US"

key_vault_name = "confluentcloudkeyvault"
key_vault_sku_name = "standard"
key_vault_soft_delete_retention_days = "7"
