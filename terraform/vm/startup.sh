#!/bin/bash

# Update package list
sudo apt-get update -y

# Install kubectl and google-cloud-sdk with GKE auth plugin
sudo apt-get install -y kubectl google-cloud-sdk-gke-gcloud-auth-plugin

# Get GKE credentials
gcloud container clusters get-credentials ${CLUSTER_NAME} --region ${REGION} --project ${PROJECT_ID}
