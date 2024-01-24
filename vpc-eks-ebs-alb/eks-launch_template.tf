# data "aws_ami" "vf-pcs-amazon-linux-2-eks" {
#   most_recent      = true
#   #owners           = ["self"]
#   owners           = [var.eks_cluster_image_owner]

#   filter {
#     name   = "name"
#     values = [var.eks_cluster_image_name]
#     #values = ["vf-pcs-amazon-linux-2-eks-1-23-v*-????-??-??t??-??-??z"]
#     #values = ["vf-pcs-amazon-linux-2-eks-1-23-v0-2023-05-22t08-07-14z"]
#   }

#   filter {
#     name   = "state"
#     values = ["available"]
#   }
# }

# resource "aws_launch_template" "eks_launch_template" {
#   name = "${var.eks_cluster_name}-launch-template"

#   #vpc_security_group_ids = [var.your_security_group.id, aws_eks_cluster.your-eks-cluster.vpc_config[0].cluster_security_group_id]
#   vpc_security_group_ids = [aws_security_group.eks_cluster.id, aws_security_group.eks_nodes.id]

#   block_device_mappings {
#     device_name = "/dev/xvda"

#     ebs {
#       volume_size = 60
#       volume_type = "gp2"
#     }
#   }

#   #image_id = var.image_id
#   image_id = data.aws_ami.vf-pcs-amazon-linux-2-eks.image_id
#   instance_type = var.instance_type

#   user_data = base64encode(<<-EOF
# MIME-Version: 1.0
# Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="

# --==MYBOUNDARY==
# Content-Type: text/x-shellscript; charset="us-ascii"

# #!/bin/bash

# set -o xtrace

# yum install -y amazon-ssm-agent 
# systemctl enable amazon-ssm-agent
# systemctl start amazon-ssm-agent
# systemctl status amazon-ssm-agent

# # echo "/etc/eks/bootstrap.sh ${var.eks_cluster_name} --b64-cluster-ca ${aws_eks_cluster.main.certificate_authority[0].data} --apiserver-endpoint ${aws_eks_cluster.main.endpoint} --use-max-pods false --max-pods=110"
# /etc/eks/bootstrap.sh ${var.eks_cluster_name} --b64-cluster-ca ${aws_eks_cluster.main.certificate_authority[0].data} --apiserver-endpoint ${aws_eks_cluster.main.endpoint} --use-max-pods false --max-pods=110

# --==MYBOUNDARY==--
#  EOF
#   )

#   tag_specifications {
#     resource_type = "instance"

#     tags = {
#       Name = "EKS-MANAGED-NODE"
#     }
#   }
# }
