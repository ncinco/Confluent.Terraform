# cluster related variables
environment = "untrusted"
cluster_name = "untrusted"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"

# service account related variables
service_accounts = [
  {
    name = "untrusted.sa.cloud-cluster-admin",
    description = "CloudClusterAdmin service account for UnTrusted cluster."
  },
  {
    name = "untrusted.sa.operator",
    description = "Operator service account for UnTrusted cluster."
  }
]
api_keys = [
  {
    name = "untrusted.api-key.cloud-cluster-admin",
    description = "untrusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-rvwrpk",
    cluster_id = "lkc-6o6706"
  },
  {
    name = "untrusted.api-key.operator",
    description = "untrusted.sa.operator",
    service_account_id = "sa-25627y",
    cluster_id = "lkc-6o6706"
  }
]

# azure resources
resource_group_name = "confluent_resource_group"
resource_group_location = "East US"

key_vault_name = "confluentcloudkeyvault"
key_vault_sku_name = "standard"
key_vault_soft_delete_retention_days = "7"
