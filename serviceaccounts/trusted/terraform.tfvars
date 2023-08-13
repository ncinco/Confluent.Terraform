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

# bindings
# https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_role_binding
# https://docs.confluent.io/cloud/current/access-management/access-control/rbac/overview.html#ccloud-rbac-roles
# https://docs.confluent.io/cloud/current/api.html#section/Identifiers-and-URLs/Confluent-Resource-Names-(CRNs)

role_bindings = [
  {
    principal   = "User:sa-8y7w3q"
    role_name   = "CloudClusterAdmin"
    crn_pattern = "crn://confluent.cloud/organization=4bcb09a9-ed92-465c-b6b6-3175ba61fe66/environment=env-63r6xq/cloud-cluster=lkc-ny160k"
  },
  {
    principal   = "User:sa-mpn8qw"
    role_name   = "Operator"
    crn_pattern = "crn://confluent.cloud/organization=4bcb09a9-ed92-465c-b6b6-3175ba61fe66/environment=env-63r6xq/cloud-cluster=lkc-ny160k"
  }
]

api_keys = [
  {
    name = "trusted.api-key.cloud-cluster-admin",
    description = "trusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-8y7w3q",
    cluster_id = "lkc-ny160k"
  },
  {
    name = "trusted.api-key.operator",
    description = "trusted.api-key.operator",
    service_account_id = "sa-mpn8qw",
    cluster_id = "lkc-ny160k"
  }
]