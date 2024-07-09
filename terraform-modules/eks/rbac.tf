data "aws_eks_cluster_auth" "cluster_auth" {
  name = aws_eks_cluster.eks.name
}

data "aws_caller_identity" "current" {}

module "aws-auth" {
  source                    = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version                   = "= 20.0"
  manage_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = aws_iam_role.eks_nodegroup_role.arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:bootstrappers", "system:nodes"]
    },
    {
      rolearn  = aws_iam_role.eks_admin_role.arn
      username = "eks-admin"
      groups   = ["system:masters"]
    },
    {
      rolearn  = aws_iam_role.eks_readonly_role.arn
      username = "eks-read-only"
      groups   = ["system:authenticated"]
    },
  ]

  aws_auth_users = [
    {
      userarn  = aws_iam_role.eks_admin_role.arn
      username = "eks-admin"
      groups   = ["system:masters"]
    },
    {
      userarn  = aws_iam_role.eks_readonly_role.arn
      username = "eks-read-only"
      groups   = ["system:authenticated"]
    },
  ]

  aws_auth_accounts = [
    data.aws_caller_identity.current.account_id,
  ]

  depends_on = [aws_eks_node_group.node-groups]
}


resource "kubernetes_role" "eks_admin_role" {
  metadata {
    name      = "eks-admin-role"
    namespace = "kube-system"
  }
  rule {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["*"]
  }
}

resource "kubernetes_role_binding" "eks_admin_binding" {
  metadata {
    name      = "eks-admin-binding"
    namespace = "kube-system"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.eks_admin_role.metadata[0].name
  }
  subject {
    kind      = "User"
    name      = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/eks-admin"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_role" "eks_read_only_role" {
  metadata {
    name      = "eks-read-only-role"
    namespace = "kube-system"
  }
  rule {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_role_binding" "eks_read_only_binding" {
  metadata {
    name      = "eks-read-only-binding"
    namespace = "kube-system"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.eks_read_only_role.metadata[0].name
  }
  subject {
    kind      = "User"
    name      = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/eks-read-only"
    api_group = "rbac.authorization.k8s.io"
  }
}