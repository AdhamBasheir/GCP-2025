resource "google_compute_network" "gke_vpc" {
  name                    = var.vpc_name
  routing_mode            = "REGIONAL"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "management_subnet" {
  name                     = "management-subnet"
  ip_cidr_range            = var.management_subnet_cidr
  region                   = var.region
  network                  = google_compute_network.gke_vpc.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "restricted_subnet" {
  name                     = "restricted-subnet"
  ip_cidr_range            = var.restricted_subnet_cidr
  region                   = var.region
  network                  = google_compute_network.gke_vpc.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = var.pods_ip_range_name
    ip_cidr_range = var.pods_ip_range
  }

  secondary_ip_range {
    range_name    = var.services_ip_range_name
    ip_cidr_range = var.services_ip_range
  }
}

resource "google_compute_router" "gke_router" {
  name    = "gke-iti-router"
  network = google_compute_network.gke_vpc.id
  region  = var.region
}

resource "google_compute_router_nat" "gke_nat" {
  name   = "gke-iti-nat"
  router = google_compute_router.gke_router.name
  region = var.region

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.management_subnet.name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_firewall" "allow_management_to_restricted" {
  name    = "allow-management-to-restricted"
  network = google_compute_network.gke_vpc.name

  direction          = "INGRESS"
  source_ranges      = [google_compute_subnetwork.management_subnet.ip_cidr_range]
  destination_ranges = [google_compute_subnetwork.restricted_subnet.ip_cidr_range]

  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_ssh_to_private_vm" {
  name    = "allow-ssh-to-private-vm"
  network = google_compute_network.gke_vpc.name

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["private-vm"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
