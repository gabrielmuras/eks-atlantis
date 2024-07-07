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
        cidr_block        = "10.0.1.0/24"
        availability_zone = "us-east-1a"
        tags = {
          Name = "private-subnet-01"
        }
      }

      private-subnet-02 = {
        cidr_block        = "10.0.2.0/24"
        availability_zone = "us-east-1b"
        tags = {
          Name = "private-subnet-02"
        }
      }
    }
  }
}