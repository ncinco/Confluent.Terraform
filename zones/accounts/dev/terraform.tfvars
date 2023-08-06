# confluent secrets
confluent_cloud_api_key = "VFRPWQE4AM5QLXS2"
confluent_cloud_api_secret = "WWNEJnKt1FQ3XzMwPt3zLfE3gtysDckvP/l7nC8Npc7pc4q51s8VRGL/loXRgeCQ"

# cluster related variables
cluster_name = "accounts_cluster_dev"
environment = "accounts_dev"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"

# topic related variables
topics = [
    { name = "accounts", partitions_count = 3, cleanup_policy = "delete"},
    { name = "transactions", partitions_count = 3, cleanup_policy = "delete"},
    { name = "superman", partitions_count = 3, cleanup_policy = "delete"}
  ]