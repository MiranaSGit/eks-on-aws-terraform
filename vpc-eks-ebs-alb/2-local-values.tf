# Define Local Values in Terraform
locals {
  owners      = var.project
  environment = var.environment
  name        = "${var.cluster_name}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
} 