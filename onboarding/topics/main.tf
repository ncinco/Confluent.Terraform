terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

module "dataplane" {
  source = "../../modules/dataplane"
	
  # cluster related variables
  environment                = var.environment
  cluster_name               = var.cluster_name

  # topic related variables
  topics                     = var.topics
}