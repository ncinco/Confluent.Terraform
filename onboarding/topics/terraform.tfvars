# cluster related variables
environment_id = "env-63292q"
cluster_id = "lkc-v1wryj"
rest_endpoint = "https://pkc-4n66v.australiaeast.azure.confluent.cloud:443"
app_manager_api_key = "S36FLCE7H4XIJZ45"
app_manager_api_secret = "phAhfJXeHB6ehQqoJkg7YmEjfrNsOC3YPq3rl+1b/mP8N0ddP5b+TN9aKxQhc4Fb"

# topic related variables
topics = [
    { name = "accounts", partitions_count = 3, cleanup_policy = "delete"},
    { name = "transactions", partitions_count = 3, cleanup_policy = "delete"},
    { name = "superman", partitions_count = 3, cleanup_policy = "delete"}
  ]