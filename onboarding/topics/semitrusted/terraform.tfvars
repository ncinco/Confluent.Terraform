# cluster related variables
environment_id         = "env-nw8gvv"
cluster_id             = "lkc-q8wrd2"
rest_endpoint          = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"

# topic related variables
topics = [
  { name = "accounts", partitions_count = 3, cleanup_policy = "compact" },
  { name = "transactions", partitions_count = 3, cleanup_policy = "compact" },
  { name = "superman", partitions_count = 3, cleanup_policy = "compact" }
]
