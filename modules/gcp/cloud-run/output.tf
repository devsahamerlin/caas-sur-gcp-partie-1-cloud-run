output "location" {
  value = google_cloud_run_v2_service.cloud_run_service.location
}

output "name" {
  value = google_cloud_run_v2_service.cloud_run_service.name
}

output "url" {
  value = google_cloud_run_v2_service.cloud_run_service.uri
}

output "endpoint" {
  value       = google_cloud_run_v2_service.cloud_run_service
}

output "project" {
  value = google_cloud_run_v2_service.cloud_run_service.project
}