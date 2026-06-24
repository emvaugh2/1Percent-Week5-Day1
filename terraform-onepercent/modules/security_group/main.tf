

# Creates the overall Security Group resource
resource "aws_security_group" "sg"  {
    vpc_id = var.vpc_id

# That from_port part still doesn't make sense but I need to learn more about VPC SGs

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

        ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

            ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

# Protocol being -1 means all protocols allowed for TCP, UDP and ICMP. 
# Ports being 0 means all ports are allowed

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}