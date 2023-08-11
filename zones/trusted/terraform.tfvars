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
    id = 1,
    name = "trusted.api-key.cloud-cluster-admin",
    description = "trusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-156m83",
    cluster_id = "lkc-r2wydp"
  },
  {
    id = 2,
    name = "trusted.api-key.operator",
    description = "trusted.api-key.operator",
    service_account_id = "sa-nrp9z3",
    cluster_id = "lkc-r2wydp"
  },
  {
    id = 3,
    name = "trusted.api-key.operator",
    description = "trusted.api-key.operator",
    service_account_id = "sa-nrp9z3",
    cluster_id = "lkc-r2wydp"
  }
]
