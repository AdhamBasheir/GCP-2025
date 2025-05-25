resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location

  network    = var.network_name
  subnetwork = var.gke_subnet_name

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  # Create a minimal default node pool to meet GKE requirements, then delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_range_name
    services_secondary_range_name = var.services_range_name
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.master_subnet_range
      display_name = "Management Subnet"
    }
  }

  node_config {
    service_account = google_service_account.gke_service_account.email
  }

  deletion_protection = false
}

resource "google_container_node_pool" "primary" {
  name       = "primary-node-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    machine_type    = var.machine_type
    service_account = google_service_account.gke_service_account.email
    tags            = ["gke-node-tag"]
  }
}

resource "google_service_account" "gke_service_account" {
  account_id   = "gke-iti-service-account"
  display_name = "GKE ITI Service Account"
}

resource "google_project_iam_member" "gke_service_account_owner" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "google_compute_firewall" "allow_egress_to_gke_master" {
  name          = "allow-egress-to-gke-master"
  network       = var.network_name
  priority      = 1000

  direction     = "EGRESS"
  target_tags = ["private-vm"]
  destination_ranges = ["172.16.0.0/28"]

  allow {
    protocol = "all"
  }
}

# resource "google_compute_firewall" "allow_http_https" {
#   name    = "allow-http-https-to-envoy"
#   network = "default"

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "443"]
#   }

#   direction    = "INGRESS"
#   source_ranges = ["0.0.0.0/0"]
#   target_tags = ["gke-node-tag"]
#   description = "Allow HTTP and HTTPS ingress to Envoy LoadBalancer"
# }

# resource "google_compute_firewall" "allow_internal" {
#   name    = "allow-internal"
#   network = "default"

#   allow {
#     protocol = "tcp"
#     ports    = ["0-65535"]
#   }
#   allow {
#     protocol = "udp"
#     ports    = ["0-65535"]
#   }
#   allow {
#     protocol = "icmp"
#   }

#   direction    = "INGRESS"
#   source_ranges = ["0.0.0.0/0"]
#   target_tags = ["gke-node-tag"]
#   description = "Allow all internal traffic from anywhere"
# }
