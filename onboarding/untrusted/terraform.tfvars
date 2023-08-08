# cluster related variables
environment_id         = "env-knrryg"
cluster_id             = "lkc-kgoxr2"
rest_endpoint          = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"

# topic related variables
topics = [
  { name = "ASB.Fraud.AccountEvents", partitions_count = 3, cleanup_policy = "compact" },
  { name = "ASB.Fraud.Card.DeadLetter", partitions_count = 3, cleanup_policy = "compact" },
  { name = "ASB.Fraud.CardActions", partitions_count = 3, cleanup_policy = "compact" },
  { name = "ASB.Fraud.CardClearingEvents", partitions_count = 3, cleanup_policy = "compact" }
]
