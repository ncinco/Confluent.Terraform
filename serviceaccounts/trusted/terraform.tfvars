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
    principal   = "User:sa-qzq8r6"
    role_name   = "CloudClusterAdmin"
    crn_pattern = "crn://confluent.cloud/organization=4bcb09a9-ed92-465c-b6b6-3175ba61fe66/environment=env-1jp61j/cloud-cluster=lkc-q8q6yd"
  },
  {
    principal   = "User:sa-g12kn3"
    role_name   = "Operator"
    crn_pattern = "crn://confluent.cloud/organization=4bcb09a9-ed92-465c-b6b6-3175ba61fe66/environment=env-1jp61j/cloud-cluster=lkc-q8q6yd"
  }
]

api_keys = [
  {
    name = "trusted.api-key.cloud-cluster-admin",
    description = "trusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-qzq8r6",
    cluster_id = "lkc-q8q6yd"
  },
  {
    name = "trusted.api-key.operator",
    description = "trusted.api-key.operator",
    service_account_id = "sa-g12kn3",
    cluster_id = "lkc-q8q6yd"
  },
  {
    name = "trusted.api-key.operator.schema-registry",
    description = "trusted.api-key.operator.schema-registry",
    service_account_id = "sa-g12kn3",
    cluster_id = "lsrc-kgz6m2"
  }
]

acls = [
  {
    kafka_cluster_id = "lkc-q8q6yd"
    name = "trusted.acl.cloud-cluster-admin",
    description = "trusted.acl.cloud-cluster-admin",
    resource_type = "CLUSTER",
    resource_name = "kafka-cluster",
    principal = "User:sa-qzq8r6",
    host = "*"
    operation = "ALTER"
    permission = "ALLOW"
    rest_endpoint = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"
  }
]
