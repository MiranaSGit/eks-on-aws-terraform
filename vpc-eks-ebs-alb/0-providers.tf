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
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
  }

  # Adding Backend as S3 for Remote State Storage
  # backend "s3" {
  #   bucket = "terraform-states-ofd"
  #   key    = "vpc-eks-ebs-alb.terraform.tfstate"
  #   region = "us-east-1"
  #   profile = "omer" 

  #   # For State Locking
  #   dynamodb_table = "vpc-eks-ebs-alb-table"    
  # }

  # # Adding local backend
  # backend "local" {
  #   path = "vpc-eks-ebs-alb-terraform.tfstate"
  # }   
}

# Terraform AWS Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "omer"
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}