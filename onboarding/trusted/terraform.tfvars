# cluster related variables
environment_id         = "env-2rxxkm"
cluster_id             = "lkc-3n65pm"
rest_endpoint          = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"

# topic related variables
topics = [
  { name = "accounts", partitions_count = 3, cleanup_policy = "delete" },
  { name = "transactions", partitions_count = 3, cleanup_policy = "delete" },
  { name = "superman", partitions_count = 3, cleanup_policy = "delete" }
]
