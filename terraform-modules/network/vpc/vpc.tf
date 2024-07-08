data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr_block

}