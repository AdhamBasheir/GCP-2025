variable "project_id" {
  default = "silver-agility-460013-n1"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "cluster_name" {
  default = "iti-gke-cluster"
}

variable "vpc_name" {
  default = "iti-gke-vpc"
}

# variable "management_subnet_cidr" {
#   type        = string
#   description = "CIDR range for the management subnet"
# }

# variable "restricted_subnet_cidr" {
#   type        = string
#   description = "CIDR range for the restricted subnet"
# }

variable "pods_ip_range_name" {
  description = "Name of secondary IP range for GKE pods"
  type        = string
  default     = "gke-pods"
}

# variable "pods_ip_range" {
#   description = "CIDR range for GKE pods"
#   type        = string
# }

variable "services_ip_range_name" {
  description = "Name of secondary IP range for GKE services"
  type        = string
  default     = "gke-services"
}

# variable "services_ip_range" {
#   description = "CIDR range for GKE services"
#   type        = string
# }