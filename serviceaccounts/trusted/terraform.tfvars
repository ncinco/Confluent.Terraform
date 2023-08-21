# service account related variables
service_accounts = [
  {
    request_id  = 1,
    name        = "trusted.sa.cloud-cluster-admin",
    description = "CloudClusterAdmin service account for Trusted cluster."
  },
  {
    request_id  = 2,
    name        = "trusted.sa.operator",
    description = "Operator service account for Trusted cluster."
  }
]

# bindings
# https://registry.terraform.io/providers/confluentinc/confluent/latest/docs/resources/confluent_role_binding
# https://docs.confluent.io/cloud/current/access-management/access-control/rbac/overview.html#ccloud-rbac-roles
# https://docs.confluent.io/cloud/current/api.html#section/Identifiers-and-URLs/Confluent-Resource-Names-(CRNs)

role_bindings = [
  {
    request_id  = 1,
    principal   = "User:sa-nr9z0d"
    role_name   = "CloudClusterAdmin"
    crn_pattern = "crn://confluent.cloud/organization=4bcb09a9-ed92-465c-b6b6-3175ba61fe66/environment=env-m89r02/cloud-cluster=lkc-3nm3xo"
  },
  {
    request_id  = 2,
    principal   = "User:sa-nr9z0d"
    role_name   = "Operator"
    crn_pattern = "crn://confluent.cloud/organization=4bcb09a9-ed92-465c-b6b6-3175ba61fe66/environment=env-m89r02/cloud-cluster=lkc-3nm3xo"
  }
]

api_keys = [
  {
    request_id         = 1,
    name               = "trusted.api-key.cloud-cluster-admin",
    description        = "trusted.api-key.cloud-cluster-admin",
    service_account_id = "sa-nr9z0d",
    cluster_id         = "lkc-3nm3xo"
  },
  {
    request_id         = 2,
    name               = "trusted.api-key.operator",
    description        = "trusted.api-key.operator",
    service_account_id = "sa-15m80v",
    cluster_id         = "lkc-3nm3xo"
  },
  {
    request_id  = 3,
    name               = "trusted.api-key.operator.schema-registry",
    description        = "trusted.api-key.operator.schema-registry",
    service_account_id = "sa-nr9z0d",
    cluster_id         = "lsrc-kgz6m2"
  }
]

acls = [
  {
    request_id       = 1,
    kafka_cluster_id = "lkc-q8q6yd"
    name             = "trusted.acl.cloud-cluster-admin",
    description      = "trusted.acl.cloud-cluster-admin",
    resource_type    = "CLUSTER",
    resource_name    = "kafka-cluster",
    principal        = "User:sa-qzq8r6",
    host             = "*"
    operation        = "ALTER"
    permission       = "ALLOW"
    rest_endpoint    = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"
  }
]