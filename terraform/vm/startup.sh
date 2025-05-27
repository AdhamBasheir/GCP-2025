#!/bin/bash

# Fetch dynamic variables from VM metadata
CLUSTER_NAME=$(curl -s metadata.google.internal/computeMetadata/v1/instance/attributes/cluster-name -H "Metadata-Flavor: Google")
REGION=$(curl -s metadata.google.internal/computeMetadata/v1/instance/attributes/region -H "Metadata-Flavor: Google")
PROJECT_ID=$(curl -s metadata.google.internal/computeMetadata/v1/instance/attributes/project-id -H "Metadata-Flavor: Google")

# Update package list
sudo apt-get update -y

# Install kubectl and google-cloud-sdk with GKE auth plugin
sudo apt-get install -y kubectl google-cloud-sdk-gke-gcloud-auth-plugin

# Get GKE credentials
gcloud container clusters get-credentials ${CLUSTER_NAME} --region ${REGION} --project ${PROJECT_ID}
