variable "eks_cluster_role_name" {
  description = "EKS cluster role name"
  type        = string
}

variable "eks_node_group_role_name" {
  description = "EKS node group role name"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet ids"
  type        = list(string)
}

variable "eks_addons" {
  description = "EKS addons"
  type        = map(object({
    version = string
  }))
}

variable "eks_node_group" {
  description = "EKS node group"
  type = map(object({
    name           = string
    instance_types = list(string)
    desired_size   = number
    max_size       = number
    min_size       = number
  }))
}