# Install EBS CSI Driver using HELM
# Resource: Helm Release 
resource "helm_release" "ebs_csi_driver" {
  depends_on = [aws_iam_role.ebs_csi_iam_role, aws_eks_node_group.eks_ng_private]
  name       = "${local.name}-aws-ebs-csi-driver"
  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart      = "aws-ebs-csi-driver"
  namespace  = "kube-system"

  set {
    name  = "image.repository"
    value = "public.ecr.aws/ebs-csi-driver/aws-ebs-csi-driver"
  }

  set {
    name  = "controller.serviceAccount.create"
    value = "true"
  }

  set {
    name  = "controller.serviceAccount.name"
    value = "ebs-csi-controller-sa"
  }

  set {
    name  = "controller.serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.ebs_csi_iam_role.arn
  }

}