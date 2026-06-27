output "repository_name" {
  value = google_artifact_registry_repository.docker.repository_id
}

output "repository_url" {
  value = google_artifact_registry_repository.docker.id
}