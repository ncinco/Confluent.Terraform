terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

module "controlplane" {
  source = "../../modules/controlplane"
	
  confluent_cloud_api_key    = "VFRPWQE4AM5QLXS2"
  confluent_cloud_api_secret = "WWNEJnKt1FQ3XzMwPt3zLfE3gtysDckvP/l7nC8Npc7pc4q51s8VRGL/loXRgeCQ"

  # cluster related variables
  environment                = var.environment
  cluster_name               = var.cluster_name
  cluster_cloud              = var.cluster_cloud
  cluster_region             = var.cluster_region

  # topic related variables
  topics                     = var.topics
}