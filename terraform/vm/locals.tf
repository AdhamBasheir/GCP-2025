locals {
  startup_script = templatefile("${path.module}/startup.sh", {
    CLUSTER_NAME = var.cluster_name
    REGION       = var.region
    PROJECT_ID   = var.project_id
  })
}
