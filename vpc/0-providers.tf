# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 3.63"
      version = ">= 4.65"
    }
  }

  # Adding Backend as S3 for Remote State Storage
  # backend "s3" {
  #   bucket = "terraform-states-ofd"
  #   key    = "vpc-terraform.tfstate"
  #   region = "us-east-1"
  #   profile = "omer" 

  #   # For State Locking
  #   dynamodb_table = "vpc-table"    
  # }  
}


# Terraform AWS Provider Block
provider "aws" {
  region  = "us-east-1"
  profile = "omer"
}
