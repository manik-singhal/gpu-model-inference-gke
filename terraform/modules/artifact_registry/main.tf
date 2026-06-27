resource "google_artifact_registry_repository" "docker" {

  location      = var.region

  repository_id = var.repository_name

  description = "Docker repository for AI images"

  format = "DOCKER"

}