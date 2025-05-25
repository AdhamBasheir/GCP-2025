variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "subnet_name" {
  type        = string
  description = "Management subnet name"
}

variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster"
}

variable "vm_name" {
  type        = string
  description = "Name of the VM instance"
}

variable "machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Machine type of the VM"
}
