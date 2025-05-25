variable "region" {
  type        = string
  description = "GCP region"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "vpc_name" {
  type        = string
  description = "VPC network name"
}

variable "management_subnet_cidr" {
  type        = string
  description = "CIDR range for the management subnet"
  default     = "10.0.1.0/24"
}

variable "restricted_subnet_cidr" {
  type        = string
  description = "CIDR range for the restricted subnet"
  default     = "10.0.2.0/24"
}

variable "pods_ip_range_name" {
  description = "Name of secondary IP range for GKE pods"
  type        = string
  default     = "gke-pods"
}

variable "pods_ip_range" {
  description = "CIDR range for GKE pods"
  type        = string
  default     = "192.168.0.0/16"
}

variable "services_ip_range_name" {
  description = "Name of secondary IP range for GKE services"
  type        = string
  default     = "gke-services"
}

variable "services_ip_range" {
  description = "CIDR range for GKE services"
  type        = string
  default     = "172.20.0.0/24"
}