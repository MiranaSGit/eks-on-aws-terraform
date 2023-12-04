# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 3.63"
      version = ">= 4.65"      
     }
    helm = {
      source = "hashicorp/helm"
      #version = "2.4.1"
      #version = "~> 2.4"
      version = "~> 2.9"
    }
    http = {
      source = "hashicorp/http"
      #version = "2.1.0"
      #version = "~> 2.1"
      version = "~> 3.3"
    }
  }

  # Adding Backend as S3 for Remote State Storage
  # backend "s3" {
  #   bucket = "terraform-states-ofd"
  #   key    = "ebs-terraform.tfstate"
  #   region = "us-east-1"
  #   profile = "omer" 
 
  #   # For State Locking
  #   dynamodb_table = "ebs-state"    
  # }   
}  


# Terraform AWS Provider Block
provider "aws" {
    region = var.aws_region
    profile = var.aws_profile
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}


# Datasource: EKS Cluster Auth 
data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_id
}

# HELM Provider
provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}