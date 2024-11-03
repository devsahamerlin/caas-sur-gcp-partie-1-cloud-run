output "vpc_network_name" {
  value = google_compute_network.gke-vpc.name
}

output "vpc_subnetwork_name" {
  value = google_compute_subnetwork.gke-subnet.name
}

output "vpc_network_self_link" {
  value = google_compute_network.gke-vpc.self_link
}