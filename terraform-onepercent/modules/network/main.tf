
# Creates the overall VPC
resource "aws_vpc" "supernet" {
    cidr_block = var.supernet
}

# Creates the public subnet
resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.supernet.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
}

# Creates the Internet Gateway (IGW)
resource "aws_internet_gateway" "public_igw" {
    vpc_id = aws_vpc.supernet.id
}

# Creates the public route table
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.supernet.id
}

# Creates the default route for the public route table
resource "aws_route" "default_route" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_igw.id
}

# Associates the public route table to the public subnet
resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}

