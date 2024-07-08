variable "vpc_cidr_block" {
  default = {
    home-lab = "10.0.0.0/16"
  }
}

variable "subnets" {
  default = {
    home-lab = {
      public-subnet-01 = {
        name              = "public-subnet-01-1a"
        cidr_block        = "10.0.1.0/24"
        availability_zone = "us-east-1a"
      }

      public-subnet-02 = {
        name              = "public-subnet-02-1b"
        cidr_block        = "10.0.2.0/24"
        availability_zone = "us-east-1b"
      }
    }
  }
}

variable "gateway_name" {
  default = {
    home-lab = "internet-gateway"
  }
}

variable "routes" {
  default = {
    home-lab = {
      public-subnet-01 = {
        name       = "public-subnet-route-01"
        cidr_block = "0.0.0.0/0"
      }

      public-subnet-02 = {
        name       = "public-subnet-route-02"
        cidr_block = "0.0.0.0/0"
      }
    }
  }

}

variable "eks_cluster_role_name" {
  default = {
    home-lab = "home-lab-eks-cluster-role"
  }
}


variable "eks_node_group_role_name" {
  default = {
    home-lab = "home-lab-node-group-role"
  }
}

variable "eks_cluster_name" {
  default = {
    home-lab = "home-lab-cluster-01"
  }
}

variable "eks_addons" {
  default = {
    home-lab = {
      vpc-cni = {
        version = "v1.18.1-eksbuild.3"

      }

      kube-proxy = {
        version = "v1.30.0-eksbuild.3"
      }

      coredns = {
        version = "v1.11.1-eksbuild.8"
      }
    }
  }
}

variable "eks_node_group" {
  default = {
    home-lab = {
      home-lab-node-group = {
        name           = "home-lab-node-group"
        instance_types = ["t2.micro"]
        desired_size   = 1
        max_size       = 2
        min_size       = 1
      }
    }
  }
}