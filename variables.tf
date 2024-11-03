variable "gcp_project_id" {
  description = "Enter the project id of the gcp project where the cluster will be registered."
  type        = string
}

variable "name_prefix" {
  description = "Prefix to apply to all artifacts created."
  type        = string
  default = "drag0524sm"
}

variable "gcp_location" {
  description = "GCP location to deploy to"
  type        = string
  default = "us-east4"
}

variable "gcp_cloud_run_image" {
  default = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "gcp_cloud_run_max_scale" {
  default = 3
}

variable "gcp_cloud_run_min_scale" {
  default = 0
}

variable "gcp_cloud_run_target" {
  default = "100"
}

variable "gcp_cloud_run_traffic_percent" {
  default = 100
}

variable "gcp_cloud_run_cpu" {
  default = "1000m"
}

variable "gcp_cloud_run_memory" {
  default = "512Mi"
}
