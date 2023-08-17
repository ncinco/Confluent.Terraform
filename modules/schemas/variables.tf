variable "registry_region" {
  description = "Registry details"
  type = object({
    environment_id = string
    cloud          = string
    region         = string
    package        = string
  })
}