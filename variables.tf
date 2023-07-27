variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key (also referred as Cloud API ID)"
  type        = string
  default     = "VFRPWQE4AM5QLXS2"
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
  sensitive   = true
  default     = "WWNEJnKt1FQ3XzMwPt3zLfE3gtysDckvP/l7nC8Npc7pc4q51s8VRGL/loXRgeCQ"
}
