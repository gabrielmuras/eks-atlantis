resource "aws_eks_node_group" "node-groups" {
    for_each        = var.eks_node_group

    cluster_name    = aws_eks_cluster.eks.name
    node_group_name = each.value.name
    node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
    subnet_ids      = var.subnet_ids
    instance_types  = each.value.instance_types

    scaling_config {
        desired_size = each.value.desired_size
        max_size     = each.value.max_size
        min_size     = each.value.min_size
    }

    update_config {
        max_unavailable = 1
    }

    depends_on = [
        aws_iam_role_policy_attachment.eks_nodegroup_AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.eks_nodegroup_AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.eks_nodegroup_AmazonEC2ContainerRegistryReadOnly,
    ]
}