EKS Cluster Deployment in a New VPC using Terraform
Overview
This repository contains Terraform configurations for provisioning an Amazon EKS (Elastic Kubernetes Service) cluster within a newly created VPC (Virtual Private Cloud). The setup includes all necessary components to establish a scalable, secure Kubernetes environment on AWS.

Project Structure
main.tf: Contains the primary Terraform configuration, including VPC, subnets, and EKS cluster resources.
variables.tf: Defines input variables for customizing the deployment.
outputs.tf: Specifies output values, such as the EKS cluster endpoint and VPC ID, for easy reference after deployment.
terraform.tfvars: Provides default values for the input variables, which can be overridden as needed.
README.md: This file, providing an overview and instructions for setup and usage.
Key Features
VPC Creation: Automates the creation of a new VPC, including public and private subnets to segregate traffic and enhance security.
EKS Cluster Deployment: Sets up an EKS cluster using Terraform, integrating with necessary AWS services and resources.
IAM Roles and Policies: Configures IAM roles and policies for secure and controlled access to AWS services and the Kubernetes cluster.
Networking and Load Balancing: Establishes networking rules and load balancers to manage traffic and ensure high availability.
Getting Started
Prerequisites
Terraform installed (v1.0.0 or later)
AWS CLI configured with appropriate access rights
![image](https://github.com/user-attachments/assets/d75f3b41-96df-43b1-a338-2a156e6c46e3)
