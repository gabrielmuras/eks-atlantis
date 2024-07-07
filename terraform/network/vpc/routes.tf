
resource "aws_route_table" "private-01" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.routes[terraform.workspace].private-route-01.cidr_block
    nat_gateway_id = aws_nat_gateway.nat-gateway-01.id
  }

  tags = {
    Name = var.routes[terraform.workspace].private-route-01.name
  }

}

resource "aws_route_table_association" "private-01" {
  subnet_id      = aws_subnet.private-subnet-01.id
  route_table_id = aws_route_table.private-01.id
}


resource "aws_route_table" "private-02" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.routes[terraform.workspace].private-route-02.cidr_block
    nat_gateway_id = aws_nat_gateway.nat-gateway-02.id
  }

  tags = {
    Name = var.routes[terraform.workspace].private-route-02.name
  }
}

resource "aws_route_table_association" "private-02" {
  subnet_id      = aws_subnet.private-subnet-02.id
  route_table_id = aws_route_table.private-02.id
}