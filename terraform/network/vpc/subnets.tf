resource "aws_subnet" "private-subnet-01" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[terraform.workspace].private-subnet-01.cidr_block
  availability_zone = var.subnets[terraform.workspace].private-subnet-01.availability_zone

  tags = var.subnets[terraform.workspace].private-subnet-01.tags
}

resource "aws_subnet" "private-subnet-02" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnets[terraform.workspace].private-subnet-02.cidr_block
  availability_zone = var.subnets[terraform.workspace].private-subnet-02.availability_zone

  tags = var.subnets[terraform.workspace].private-subnet-02.tags
}
