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
    name = "trusted.api-key.cloud-cluster-admin v6",
    description = "trusted.api-key.cloud-cluster-admin v6",
    service_account_id = "sa-35krgm",
    cluster_id = "lkc-8m7dg0"
  },
  {
    name = "trusted.api-key.operator v6",
    description = "trusted.api-key.operator v6",
    service_account_id = "sa-nr1w33",
    cluster_id = "lkc-8m7dg0"
  }
]
