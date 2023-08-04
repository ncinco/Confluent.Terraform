# confluent secrets
confluent_cloud_api_key = "VFRPWQE4AM5QLXS2"
confluent_cloud_api_secret = "WWNEJnKt1FQ3XzMwPt3zLfE3gtysDckvP/l7nC8Npc7pc4q51s8VRGL/loXRgeCQ"

# cluster related variables
cluster_name = "kiwisaver_cluster_dev"
environment = "kiwisaver_dev"
cluster_cloud = "AZURE"
cluster_region = "australiaeast"

# topic related variables
topics = [
    { name = "growth", partitions_count = 1, cleanup_policy = "delete"},
    { name = "conservative", partitions_count = 1, cleanup_policy = "delete"},
    { name = "batman", partitions_count = 1, cleanup_policy = "delete"}
  ]