# cluster related variables
cluster_name = "kiwisaver_cluster"
environment = "kiwisaver_prod"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"

# topic related variables
topics = [
    { name = "growth", partitions_count = 8, cleanup_policy = "delete"},
    { name = "conservative", partitions_count = 7, cleanup_policy = "delete"},
    { name = "batman", partitions_count = 7, cleanup_policy = "delete"}
  ]