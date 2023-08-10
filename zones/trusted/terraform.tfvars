# cluster related variables
environment = "trusted"
cluster_name = "trusted"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"

# service account related variables
service_accounts = [
  {
    name = "trusted.sa.cloud-cluster-admin",
    description = "CloudClusterAdmin service account for Trusted cluster."
  },
  {
    name = "trusted.sa.operator",
    description = "Operator service account for Trusted cluster."
  }
]
api_keys = [
  {
    name = "trusted.api-key.cloud-cluster-admin",
    description = "trusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-rvwrpk",
    cluster_id = "lkc-6o6706"
  },
  {
    name = "trusted.api-key.operator",
    description = "trusted.sa.operator",
    service_account_id = "sa-25627y",
    cluster_id = "lkc-6o6706"
  }
]