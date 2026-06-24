

# Grabs the subnet id
variable "subnet_id" {}

# Grabs the security group id
variable "sg_id" {}

# Grabs the name of the master and worker nodes
variable "name" {}

# Creates the SSH private key
variable "key_name" {
    default = null
}

