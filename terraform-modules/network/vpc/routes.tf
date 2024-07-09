resource "aws_route_table" "public" {
  for_each = var.routes
  vpc_id   = aws_vpc.main.id

  route {
    cidr_block = each.value.cidr_block
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = each.value.name
  }

}

resource "aws_route_table_association" "subnet_assoc" {
  for_each = var.subnets

  subnet_id      = aws_subnet.public-subnet[each.key].id
  route_table_id = aws_route_table.public[each.key].id
}