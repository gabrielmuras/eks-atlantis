provider "aws" {
  region  = var.aws_region
  #profile = "home-lab"
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.eks_cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.eks_cluster_name
}

data "aws_iam_openid_connect_provider" "oidc_provider" {
  url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer

}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

terraform {
  required_version = ">= 1.7.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.57.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "= 2.14.0"
    }
  }
}