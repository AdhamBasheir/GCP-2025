output "repo_name" {
  value = google_artifact_registry_repository.gar_repo.name
}

output "repo_id" {
  value = google_artifact_registry_repository.gar_repo.repository_id
}

output "repo_location" {
  value = google_artifact_registry_repository.gar_repo.location
}

output "repo_url" {
  value = "${google_artifact_registry_repository.gar_repo.location}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.gar_repo.name}/"
}
