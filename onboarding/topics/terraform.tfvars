# cluster related variables
environment = "accounts_dev"
cluster_name = "accounts_cluster_dev"

# topic related variables
topics = [
    { name = "accounts", partitions_count = 3, cleanup_policy = "delete"},
    { name = "transactions", partitions_count = 3, cleanup_policy = "delete"},
    { name = "superman", partitions_count = 3, cleanup_policy = "delete"}
  ]