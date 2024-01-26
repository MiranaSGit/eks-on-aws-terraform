# Generic Variables
aws_region  = "eu-west-1"
aws_profile = "pia-omer"
environment = "test"
project     = "mirana"

# VPC Variables
vpc_cidr_block      = "10.0.0.0/16"
vpc_public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
# vpc_database_subnets= ["10.0.151.0/24", "10.0.152.0/24"]
# vpc_create_database_subnet_group = true 
# vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = false  # Enable if you put nodes into private subnet
vpc_single_nat_gateway = false  # Enable if you put nodes into private subnet and want only one NAT Gateway
keypair                = "pia"

# EKS Cluster Variables
cluster_name                         = "eks"
cluster_service_ipv4_cidr            = "172.20.0.0/16"
cluster_version                      = "1.28"
cluster_endpoint_private_access      = true
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
eks_oidc_root_ca_thumbprint          = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"