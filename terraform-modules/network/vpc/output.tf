output "subnet_ids" {
    value = [ for subnet in aws_subnet.public-subnet : subnet.id ]
}