# cluster related variables
environment_id         = "env-w5ggx5"
cluster_id             = "lkc-wzwjgw"
rest_endpoint          = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"

# topic related variables
topics = [
  { name = "ASB.Digital.EventComms", partitions_count = 3, cleanup_policy = "compact" },
  { name = "ASB.Digital.FraudAlertFeedback", partitions_count = 3, cleanup_policy = "compact" },
  { name = "ASB.Digital.Payments.Notifications", partitions_count = 3, cleanup_policy = "compact" }
]
