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


resource "confluent_schema" "purchase-topic" {
  schema_registry_cluster {
    id = "lsrc-kgz6m2"
  }
  rest_endpoint = "https://psrc-9wjxm.southeastasia.azure.confluent.cloud"
  subject_name = "purchase-topic-value"
  format = "AVRO"
  schema = file("./schemas/avro/purchase.avsc")
  credentials {
    key    = "YINFU7VOI67X56JX"
    secret = "ewDBIIQyb91ZrGCpsKsolC2vlnid2/BYYDXg09npgAt5Qlz/wTVeRo1FA0whMT6i"
  }
}

resource "confluent_tag" "tag-envrionment" {
  schema_registry_cluster {
    id = "lsrc-kgz6m2"
  }
  rest_endpoint = "https://psrc-9wjxm.southeastasia.azure.confluent.cloud"
  credentials {
    key    = "YINFU7VOI67X56JX"
    secret = "ewDBIIQyb91ZrGCpsKsolC2vlnid2/BYYDXg09npgAt5Qlz/wTVeRo1FA0whMT6i"
  }

  name = "environment_tag"
  description = "environment_tag"

  lifecycle {
    prevent_destroy = true
  }
}

resource "confluent_tag" "tag-pii" {
  schema_registry_cluster {
    id = "lsrc-kgz6m2"
  }
  rest_endpoint = "https://psrc-9wjxm.southeastasia.azure.confluent.cloud"
  credentials {
    key    = "YINFU7VOI67X56JX"
    secret = "ewDBIIQyb91ZrGCpsKsolC2vlnid2/BYYDXg09npgAt5Qlz/wTVeRo1FA0whMT6i"
  }

  name = "PII"
  description = "Personally identifiable information"

  lifecycle {
    prevent_destroy = true
  }
}

resource "confluent_tag_binding" "tag-binding-topic-zero-environment-tag" {
  schema_registry_cluster {
    id = "lsrc-kgz6m2"
  }
  rest_endpoint = "https://psrc-9wjxm.southeastasia.azure.confluent.cloud"
  credentials {
    key    = "YINFU7VOI67X56JX"
    secret = "ewDBIIQyb91ZrGCpsKsolC2vlnid2/BYYDXg09npgAt5Qlz/wTVeRo1FA0whMT6i"
  }

  tag_name = "environment_tag"
  entity_name = "lsrc-kgz6m2:lkc-3nm3xo:topic_0"
  entity_type = "kafka_topic"

  lifecycle {
    prevent_destroy = true
  }
}

resource "confluent_tag_binding" "tag-binding-topic-zero-pii" {
  schema_registry_cluster {
    id = "lsrc-kgz6m2"
  }
  rest_endpoint = "https://psrc-9wjxm.southeastasia.azure.confluent.cloud"
  credentials {
    key    = "YINFU7VOI67X56JX"
    secret = "ewDBIIQyb91ZrGCpsKsolC2vlnid2/BYYDXg09npgAt5Qlz/wTVeRo1FA0whMT6i"
  }

  tag_name = "PII"
  entity_name = "lsrc-kgz6m2:.:100004:com.mycorp.mynamespace.sampleRecord.my_field1"
  entity_type = "sr_field"

  lifecycle {
    prevent_destroy = true
  }
}