output "vm_name" {
  value = google_compute_instance.private_vm.name
}

output "vm_zone" {
  value = google_compute_instance.private_vm.zone
}

output "vm_self_link" {
  value = google_compute_instance.private_vm.self_link
}

output "private_vm_internal_ip" {
  value = google_compute_instance.private_vm.network_interface[0].network_ip
}
