variable "vpc_cidr_block" {

  description = "VPC cidr block"

  default = {
    home-lab = "10.0.0.0/16"
  }
}

variable "subnets" {
  description = "Subnets configuration"

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

variable "gateway" {
  description = "Gateways configuration"

  default = {
    home-lab = "internet-gateway"
  }
}

variable "routes" {
  description = "Routes configuration"

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