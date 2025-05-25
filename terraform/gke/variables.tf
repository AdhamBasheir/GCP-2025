variable "zone" {
  type        = string
  description = "GCP zone"
}

variable "location" {
  type        = string
  description = "GCP location"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "gke_subnet_name" {
  type        = string
  description = "Name of the GKE subnet"
}

variable "master_subnet_range" {
  type        = string
  description = "CIDR range for the management subnet"
}

variable "cluster_name" {
  type        = string
  description = "GKE cluster name"
}

variable "pods_range_name" {
  type        = string
  description = "Name of the secondary range for pods"
}

variable "services_range_name" {
  type        = string
  description = "Name of the secondary range for services"
}

variable "node_count" {
  default = 1
}

variable "machine_type" {
  default = "e2-medium"
}