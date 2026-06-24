



# Creates the EC2 general Instance

resource "aws_instance" "general" {
    # AMI - Amazon Machine Image
    # ami = data.aws_ssm_parameter.amazon_linux_2023.value
    ami = "ami-08f44e8eca9095668"
    instance_type = "t3.micro"

    subnet_id = var.subnet_id
    # Amazon expects a list for the SG. That's why we have it in brackets.
    vpc_security_group_ids = [var.sg_id]

    key_name = var.key_name

    tags = {
        Name = var.name
    }
}