# output "kubeconfig" {
#   value       = "gcloud container clusters get-credentials ${var.cluster_name} --region ${var.region}"
#   description = "Run this command to configure kubectl for the GKE cluster"
# }

output "docker_commands_one_line" {
  value       = "docker build -t gcr.io/${var.project_id}/my-app:latest . && docker push gcr.io/${var.project_id}/my-app:latest"
  description = "Run this command to tag and push your Docker image to Google Artifact Registry"
}

output "vm_ssh_command" {
  value       = "gcloud compute ssh ${module.vm.vm_name} --zone ${module.vm.vm_zone} --tunnel-through-iap"
  description = "Run this command to SSH into the private VM via IAP"
}

output "copy_k8s_folder_command" {
  value       = "gcloud compute scp --recurse k8s ${module.vm.vm_name}: --zone ${module.vm.vm_zone} --project ${var.project_id} --tunnel-through-iap"
  description = "Run this from the directory inside 'k8s/' folder"
}
