resource "google_compute_network" "gke-vpc" {
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "gke-subnet" {
  name          = "${var.name}-subnet"
  region        = var.region
  network       = google_compute_network.gke-vpc.name
  ip_cidr_range = var.ip_cidr_range #
}