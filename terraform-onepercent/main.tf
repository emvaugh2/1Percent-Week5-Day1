
# Grabs the network module

module "network" {
    source = "./modules/network"
}

# Grabs the security group module

module "security_group" {
    source = "./modules/security_group"

    vpc_id = module.network.vpc_id
}


# Generates the key pair for the master node
resource "tls_private_key" "master_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

# Saves the private key locally
resource "local_file" "master_private_key" {
    # PEM - privacy enhanced mail
    content = tls_private_key.master_key.private_key_pem
    # The path.module denotes where the current file (root main.tf) lives which is under terraform-onepercent directory
    # Don't let the naming confuse you. So the pem file path will be ~/terraform-onepercent/master-private-key.pem
    filename = "${path.module}/master-private-key.pem"
    file_permission = "0600"
}

# Uploads public key to AWS
resource "aws_key_pair" "master_public_key" {
    key_name = "master-public-key"
    public_key = tls_private_key.master_key.public_key_openssh
}



# Creates the master node from the EC2 Instance module


module "ec2_master" {
    source = "./modules/ec2_instance"

    subnet_id = module.network.public_subnet_id
    sg_id = module.security_group.sg_id
    name = "master"
    key_name = aws_key_pair.master_public_key.key_name

}

# Creates the worker nodes from the EC2 Instance module

module "ec2_workers" {
    source = "./modules/ec2_instance"
    count = 3


    subnet_id = module.network.public_subnet_id
    sg_id = module.security_group.sg_id

    key_name = aws_key_pair.master_public_key.key_name
    


    # Labels the workers 1, 2, and 3 for distinction
    name = "worker-${count.index + 1}"
}


# Grabs the S3 module

module "s3_bucket" {
    source = "./modules/s3"
}