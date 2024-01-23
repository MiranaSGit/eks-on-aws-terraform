# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../eks/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }
}

# Terraform Remote State Datasource - Remote Backend AWS S3
# data "terraform_remote_state" "eks" {
#   backend = "s3"
#   config = {
#     bucket = "terraform-states-ofd"
#     key    = "eks.terraform.tfstate"
#     region = var.aws_region
#     profile = var.aws_profile
#   }
# }

# Terraform Remote State Datasource - Remote Backend AWS S3
# data "terraform_remote_state" "vpc" {
#   backend = "s3"
#   config = {
#     bucket = "terraform-states-ofd"
#     key    = "vpc.terraform.tfstate"
#     region = var.aws_region
#     profile = var.aws_profile
#   }
# }

