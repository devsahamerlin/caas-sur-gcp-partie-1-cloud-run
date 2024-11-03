terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.14.0"
    }
  }
  required_version = ">= 0.13"
}

provider "google" {
  project = var.gcp_project_id
}