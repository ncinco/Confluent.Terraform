# cluster related variables
environment = "semitrusted"
cluster_name = "semitrusted"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"

# service account related variables
service_accounts = [
  {
    name = "semitrusted.sa.cloud-cluster-admin",
    description = "CloudClusterAdmin service account for SemiTrusted cluster."
  },
  {
    name = "untrusted.sa.operator",
    description = "Operator service account for SemiTrusted cluster."
  }
]
api_keys = [
  {
    name = "semitrusted.api-key.cloud-cluster-admin",
    description = "semitrusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-rvwrpk",
    cluster_id = "lkc-6o6706"
  },
  {
    name = "semitrusted.api-key.operator",
    description = "semitrusted.sa.operator",
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
