terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

module "controlplane" {
  source = "../../../modules/controlplane"
	
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret

  # cluster related variables
  environment                = var.environment
  cluster_name               = var.cluster_name
  cluster_cloud              = var.cluster_cloud
  cluster_region             = var.cluster_region

  # topic related variables
  topics                     = var.topics
}