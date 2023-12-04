data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../eks/terraform.tfstate"
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