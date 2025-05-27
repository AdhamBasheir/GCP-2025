module "vpc" {
  source     = "../vpc"
  project_id = var.project_id
  region     = var.region
  vpc_name   = var.vpc_name
}

module "gke" {
  source              = "../gke"
  project_id          = var.project_id
  region              = var.region
  zone                = var.zone
  network_name        = module.vpc.vpc_network_name
  gke_subnet_name     = module.vpc.restricted_subnet_name
  master_subnet_range = module.vpc.management_subnet_range
  cluster_name        = var.cluster_name
  pods_range_name     = module.vpc.pods_ip_range_name
  services_range_name = module.vpc.services_ip_range_name

}

module "vm" {
  source       = "../vm"
  project_id   = var.project_id
  region       = var.region
  zone         = var.zone
  network_name = module.vpc.vpc_network_name
  subnet_name  = module.vpc.management_subnet_name
  cluster_name = var.cluster_name
  vm_name      = "mgmt-vm"
  machine_type = "e2-medium"
}
