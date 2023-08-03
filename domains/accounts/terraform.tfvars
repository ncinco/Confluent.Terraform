# cluster related variables
cluster_name = "bank_accounts_cluster"
environment = "accounts_prod"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"

# topic related variables
topics = [
    { name = "accounts", partitions_count = 3, cleanup_policy = "delete"},
    { name = "transactions", partitions_count = 3, cleanup_policy = "delete"},
    { name = "superman", partitions_count = 3, cleanup_policy = "delete"}
  ]