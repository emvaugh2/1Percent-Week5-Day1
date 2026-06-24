

# Gives the EC2 instance IDs
output "instance_id"  {
    value = aws_instance.general.id
}

# Gives the public IPs (PIP) for the instances
output "public_ip" {
    value = aws_instance.general.public_ip
}