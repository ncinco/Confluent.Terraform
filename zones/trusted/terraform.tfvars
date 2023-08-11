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
    service_account_id = "sa-156m83",
    cluster_id = "lkc-r2wydp"
  },
  {
    name = "trusted.api-key.operator v6",
    description = "trusted.api-key.operator v6",
    service_account_id = "sa-nrp9z3",
    cluster_id = "lkc-r2wydp"
  },
  {
    name = "trusted.api-key.cloud-cluster-admin v7",
    description = "trusted.api-key.cloud-cluster-admin v7",
    service_account_id = "sa-156m83",
    cluster_id = "lkc-r2wydp"
  },
  {
    name = "trusted.api-key.operator v7",
    description = "trusted.api-key.operator v7",
    service_account_id = "sa-nrp9z3",
    cluster_id = "lkc-r2wydp"
  }
,
  {
    name = "trusted.api-key.cloud-cluster-admin v8",
    description = "trusted.api-key.cloud-cluster-admin v8",
    service_account_id = "sa-156m83",
    cluster_id = "lkc-r2wydp"
  },
  {
    name = "trusted.api-key.operator v8",
    description = "trusted.api-key.operator v8",
    service_account_id = "sa-nrp9z3",
    cluster_id = "lkc-r2wydp"
  }
]
