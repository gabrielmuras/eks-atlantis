module "vpc" {
    source = "./terraform-modules/network/vpc"
    vpc_cidr_block = var.vpc_cidr_block[terraform.workspace]
    subnets = var.subnets[terraform.workspace]
    gateway = var.gateway[terraform.workspace]
    routes = var.routes[terraform.workspace]

}