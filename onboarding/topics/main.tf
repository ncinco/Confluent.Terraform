terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}


provider "confluent" {
  cloud_api_key    = "2UIEY3CFZLK2FHO2"
  cloud_api_secret = "sUtPE0Kfkp5Y24V2AJZaXGgq2W58SnuRo6RP+V+HSWiJ4x2uG3afxSfq1ppoIQJG"
}

module "dataplane" {
  source = "../../modules/dataplane"

  # cluster related variables
  environment_id         = var.environment_id
  cluster_id             = var.cluster_id
  rest_endpoint          = var.rest_endpoint
  app_manager_api_key    = var.app_manager_api_key
  app_manager_api_secret = var.app_manager_api_secret

  # topic related variables
  topics = var.topics
}