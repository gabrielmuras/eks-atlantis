resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.gateways[terraform.workspace].internet-gateway.name
  }
}

resource "aws_eip" "nat-gateway-01" {
  depends_on = [aws_internet_gateway.internet-gateway]
  domain     = var.gateways[terraform.workspace].nat-gateway-01.elastic-ip-domain
}

resource "aws_eip" "nat-gateway-02" {
  depends_on = [aws_internet_gateway.internet-gateway]
  domain     = var.gateways[terraform.workspace].nat-gateway-02.elastic-ip-domain
}

resource "aws_nat_gateway" "nat-gateway-01" {
  allocation_id = aws_eip.nat-gateway-01.id
  subnet_id     = aws_subnet.private-subnet-01.id
  tags = {
    Name = var.gateways[terraform.workspace].nat-gateway-01.name
  }
}

resource "aws_nat_gateway" "nat-gateway-02" {
  allocation_id = aws_eip.nat-gateway-02.id
  subnet_id     = aws_subnet.private-subnet-02.id

  tags = {
    Name = var.gateways[terraform.workspace].nat-gateway-02.name
  }
}
