
# Grabs the VPC ID
output "vpc_id" {
    value = aws_vpc.supernet.id
}

# Grabs the subnet ID
output "public_subnet_id" {
    value = aws_subnet.public_subnet.id
}

