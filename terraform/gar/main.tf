resource "google_artifact_registry_repository" "gar_repo" {
  project       = var.project_id
  location      = var.region
  format        = var.format
  repository_id = var.repository_id
}
