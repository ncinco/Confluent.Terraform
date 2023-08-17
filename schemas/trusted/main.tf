terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.51.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Terraform_State"
    storage_account_name = "confluentstate"
    container_name       = "trusted"
    key                  = "schemas.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "schemas" {
  source = "../../modules/schemas"

  registry_region = var.registry_region
}


resource "confluent_schema" "purchase" {
  schema_registry_cluster {
    id = "lsrc-kgz6m2"
  }
  rest_endpoint = "https://psrc-9wjxm.southeastasia.azure.confluent.cloud"
  # https://developer.confluent.io/learn-kafka/schema-registry/schema-subjects/#topicnamestrategy
  subject_name = "purchase-topic-value"
  format = "AVRO"
  schema = file("./schemas/avro/purchase.avsc")
  credentials {
    key    = "YINFU7VOI67X56JX"
    secret = "ewDBIIQyb91ZrGCpsKsolC2vlnid2/BYYDXg09npgAt5Qlz/wTVeRo1FA0whMT6i"
  }
}