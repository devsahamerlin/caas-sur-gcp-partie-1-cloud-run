resource "google_artifact_registry_repository" "artifact-registry-repo" {
  location      = var.repository_location
  repository_id = var.repository_id
  description   = var.repository_description
  format        = var.repository_format
  project = var.project_id
}