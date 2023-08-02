terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
  }
}

module "controlplane" {
	source = "../controlplane"
	
	confluent_cloud_api_key		= "VFRPWQE4AM5QLXS2"
	confluent_cloud_api_secret	= "WWNEJnKt1FQ3XzMwPt3zLfE3gtysDckvP/l7nC8Npc7pc4q51s8VRGL/loXRgeCQ"
	cluster_name				= "bank accounts"
	cluster_cloud				= "AZURE"
	cluster_region				= "australiaeast"
}