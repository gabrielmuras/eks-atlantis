variable "vpc_cidr_block" {

  description = "VPC cidr block"
  type        = string
}

variable "subnets" {
  description = "Subnets configuration"
  type       = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
}

variable "gateway" {
  description = "Gateways configuration"
  type        = string
}

variable "routes" {
  description = "Routes configuration"
  type = map(object({
    name       = string
    cidr_block = string
  }))
}