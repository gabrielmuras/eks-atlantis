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
      private-subnet-01 = {
        name              = "private-subnet-01"
        cidr_block        = "10.0.1.0/24"
        availability_zone = "us-east-1a"
      }

      private-subnet-02 = {
        name              = "private-subnet-02"
        cidr_block        = "10.0.2.0/24"
        availability_zone = "us-east-1b"
      }
    }
  }
}

variable "gateways" {
  description = "Gateways configuration"

  default = {
    home-lab = {
      internet-gateway = {
        name = "internet-gateway"
      }

      nat-gateway-01 = {
        name              = "nat-gateway-01"
        elastic-ip-domain = "vpc"

      }

      nat-gateway-02 = {
        name              = "nat-gateway-02"
        elastic-ip-domain = "vpc"
      }
    }
  }

}