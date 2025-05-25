variable "region" {
  type        = string
  description = "GCP region"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "format" {
  type        = string
  description = "Format of the Artifact Registry repository (e.g., DOCKER, MAVEN, NPM)"
  default     = "DOCKER"
}

variable "repository_id" {
  type        = string
  description = "ID of the Artifact Registry repository"
}