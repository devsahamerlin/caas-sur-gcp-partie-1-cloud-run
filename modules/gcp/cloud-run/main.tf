resource "google_cloud_run_v2_service" "cloud_run_service" {
  name     = var.name
  location = var.gcp_region
  ingress = var.ingress

  template {
    service_account = var.service_account_name
    scaling {
      max_instance_count = var.maxScale
      min_instance_count = var.minScale
    }
    containers {
      image = var.image
      env {
        name = "GCP_LOCATION"
        value = var.gcp_region
      }
      env {
        name = "PROJECT_ID"
        value = var.project_id
      }
    }
  }
}

resource "google_cloud_run_service_iam_binding" "iam-binding" {
  location = google_cloud_run_v2_service.cloud_run_service.location
  service  = google_cloud_run_v2_service.cloud_run_service.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}