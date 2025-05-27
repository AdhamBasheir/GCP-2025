resource "google_compute_instance" "private_vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name
    access_config {
      // Omit to disable external IP
      // Leave empty block to enable NAT access through Cloud NAT
    }
  }

  service_account {
    email  = google_service_account.vm_service_account.email
    scopes = ["cloud-platform"]
  }

  tags = ["private-vm"]

  metadata = {
    enable-oslogin = "TRUE"
    startup-script = local.startup_script
    cluster-name   = var.cluster_name
    region         = var.region
    project-id     = var.project_id
  }
}

resource "google_service_account" "vm_service_account" {
  account_id   = "vm-iti-service-account"
  display_name = "VM ITI Service Account"
}

resource "google_project_iam_member" "vm_service_account_owner" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.vm_service_account.email}"
}
