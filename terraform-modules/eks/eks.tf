resource "aws_eks_cluster" "eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy
  ]
}

resource "aws_eks_addon" "addons" {
  for_each      = var.eks_addons
  cluster_name  = aws_eks_cluster.eks.name
  addon_name    = each.key
  addon_version = each.value.version

  depends_on = [
    aws_eks_cluster.eks,
    aws_eks_node_group.node-groups
  ]
}
