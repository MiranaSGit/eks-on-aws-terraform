# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 4.12"
      version = ">= 4.65"
     }
    helm = {
      source = "hashicorp/helm"
      #version = "2.5.1"
      #version = "~> 2.5"
      version = ">= 2.9"
    }
    http = {
      source = "hashicorp/http"
      #version = "2.1.0"
      #version = "~> 2.1"
      version = ">= 3.3"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "~> 2.11"
      version = ">= 2.20"
    }      
  }
  # Adding Backend as S3 for Remote State Storage
  # backend "s3" {
  #   bucket = "terraform-states-ofd"
  #   key    = "eks-fargate-alb-terraform.tfstate"
  #   region = "us-east-1"
  #   profile = "omer" 
 
  #   # For State Locking
  #   dynamodb_table = "eks-fargate-alb-state"   
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