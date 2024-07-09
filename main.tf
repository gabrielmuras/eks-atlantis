module "vpc" {
  source         = "./terraform-modules/network/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  subnets        = var.subnets
  gateway_name   = var.gateway_name
  routes         = var.routes

}

module "eks" {
  source                   = "./terraform-modules/eks"
  eks_cluster_name         = var.eks_cluster_name
  eks_cluster_role_name    = var.eks_cluster_role_name
  eks_node_group_role_name = var.eks_node_group_role_name
  eks_node_group           = var.eks_node_group
  subnet_ids               = module.vpc.subnet_ids
  eks_addons               = var.eks_addons

  depends_on = [module.vpc]

}

module "load-balancer-controller" {
  source                           = "./terraform-modules/network/load-balancer-controller"
  cluster_name                     = var.eks_cluster_name
  cluster_identity_oidc_issuer     = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer
  cluster_identity_oidc_issuer_arn = data.aws_iam_openid_connect_provider.oidc_provider.arn
  aws_region                       = var.aws_region
  vpc_id                           = module.vpc.vpc_id

  depends_on = [module.eks]
}

module "atlantis" {
  source                         = "./terraform-modules/atlantis"
  orgAllowlist                   = var.atlantis.orgAllowlist
  atlantisDataDirectory          = var.atlantis.atlantisDataDirectory
  ingress_annotations_class      = var.atlantis.ingress_annotations_class
  ingress_annotations_type       = var.atlantis.ingress_annotations_type
  ingress_annotations_subnet     = tostring(join(",", module.vpc.subnet_ids))
  github_user                    = var.atlantis.github_user
  github_token                   = var.atlantis.github_token
  github_webhook_secret          = var.atlantis.github_webhook_secret
  atlantis_aws_secret_access_key = var.atlantis.atlantis_aws_secret_access_key
  atlantis_aws_access_key_id     = var.atlantis.atlantis_aws_access_key_id

  depends_on = [module.load-balancer-controller]
}