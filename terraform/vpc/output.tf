output "vpc_id" {
  value = google_compute_network.gke_vpc.id
}

output "vpc_network_name" {
  value = google_compute_network.gke_vpc.name
}

output "management_subnet_id" {
  value = google_compute_subnetwork.management_subnet.id
}

output "management_subnet_name" {
  value = google_compute_subnetwork.management_subnet.name
}

output "management_subnet_range" {
  value = google_compute_subnetwork.management_subnet.ip_cidr_range
}

output "restricted_subnet_id" {
  value = google_compute_subnetwork.restricted_subnet.id
}

output "restricted_subnet_name" {
  value = google_compute_subnetwork.restricted_subnet.name
}

output "restricted_subnet_range" {
  value = google_compute_subnetwork.restricted_subnet.ip_cidr_range
}

output "pods_ip_range_name" {
  value = google_compute_subnetwork.restricted_subnet.secondary_ip_range[0].range_name
}

output "pods_ip_range" {
  value = google_compute_subnetwork.restricted_subnet.secondary_ip_range[0].ip_cidr_range
}

output "services_ip_range_name" {
  value = google_compute_subnetwork.restricted_subnet.secondary_ip_range[1].range_name
}

output "services_ip_range" {
  value = google_compute_subnetwork.restricted_subnet.secondary_ip_range[1].ip_cidr_range
}
