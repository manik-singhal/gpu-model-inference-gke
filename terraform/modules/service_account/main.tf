resource "google_service_account" "gke_nodes" {

  account_id   = var.account_id
  display_name = var.display_name

}

resource "google_project_iam_member" "logging" {

  project = var.project_id
  role    = "roles/logging.logWriter"

  member = "serviceAccount:${google_service_account.gke_nodes.email}"
}

resource "google_project_iam_member" "monitoring_writer" {

  project = var.project_id
  role    = "roles/monitoring.metricWriter"

  member = "serviceAccount:${google_service_account.gke_nodes.email}"
}

resource "google_project_iam_member" "artifact_registry" {

  project = var.project_id
  role    = "roles/artifactregistry.reader"

  member = "serviceAccount:${google_service_account.gke_nodes.email}"
}