# cluster related variables
environment_id         = "env-6320dj"
cluster_id             = "lkc-o2vqd9"
rest_endpoint          = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"

# topic related variables
topics = [
  { name = "accounts", partitions_count = 3, cleanup_policy = "compact" },
  { name = "transactions", partitions_count = 3, cleanup_policy = "compact" },
  { name = "superman", partitions_count = 3, cleanup_policy = "compact" }
]
