module "vpc" {
  source         = "./terraform-modules/network/vpc"
  vpc_cidr_block = var.vpc_cidr_block[terraform.workspace]
  subnets        = var.subnets[terraform.workspace]
  gateway_name   = var.gateway_name[terraform.workspace]
  routes         = var.routes[terraform.workspace]

}

module "eks" {
  source                   = "./terraform-modules/eks"
  eks_cluster_name         = var.eks_cluster_name[terraform.workspace]
  eks_cluster_role_name    = var.eks_cluster_role_name[terraform.workspace]
  eks_node_group_role_name = var.eks_node_group_role_name[terraform.workspace]
  eks_node_group           = var.eks_node_group[terraform.workspace]
  subnet_ids               = module.vpc.subnet_ids
  eks_addons               = var.eks_addons[terraform.workspace]

}
