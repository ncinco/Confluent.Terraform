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
    name = "trusted.api-key.cloud-cluster-admin v5",
    description = "trusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-156m83",
    cluster_id = "lkc-r2wydp"
  },
  {
    name = "trusted.api-key.operator v5",
    description = "trusted.api-key.operator",
    service_account_id = "sa-nrp9z3",
    cluster_id = "lkc-r2wydp"
  }
]
