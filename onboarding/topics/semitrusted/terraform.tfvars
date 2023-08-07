# cluster related variables
environment_id         = "env-nw8gvv"
cluster_id             = "lkc-q8wrd2"
rest_endpoint          = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"
app_manager_api_key    = "AEG7FJDIM3U6VH7F"
app_manager_api_secret = "jySRE6Fx/iubikRc0vE7iOJogy5p9ZD/V4F+1OP1M6lOC1QHJJTevdtplViLdtqm"

# topic related variables
topics = [
  { name = "accounts", partitions_count = 3, cleanup_policy = "compact" },
  { name = "transactions", partitions_count = 3, cleanup_policy = "compact" },
  { name = "superman", partitions_count = 3, cleanup_policy = "compact" }
]