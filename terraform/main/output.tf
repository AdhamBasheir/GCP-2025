# output "kubeconfig" {
#   value       = "gcloud container clusters get-credentials ${var.cluster_name} --region ${var.region}"
#   description = "Run this command to configure kubectl for the GKE cluster"
# }

output "docker_commands_one_line" {
  value = "docker tag my-image ${module.gar.repo_url}/my-image && docker push ${module.gar.repo_url}/my-image"
  description = "Run this command to tag and push your Docker image to Google Artifact Registry"
}

output "vm_ssh_command" {
  value       = "gcloud compute ssh ${module.vm.vm_name} --zone ${module.vm.vm_zone} --tunnel-through-iap"
  description = "Run this command to SSH into the private VM via IAP"
}

output "copy_k8s_folder_command" {
  value = "gcloud compute scp --recurse ./k8s ${module.vm.vm_name}:~/ --zone ${module.vm.vm_zone} --project ${var.project_id} --tunnel-through-iap"
  description = "Run this from the directory where the 'k8s/' folder exists (e.g., project root)"
}


# output "private_vm_internal_ip" {
#   value = module.vm.private_vm_internal_ip
# }

