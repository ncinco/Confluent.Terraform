resource "confluent_service_account" "app-manager" {
  display_name = "app-manager"
  description  = "Service Account for accounts app"
}