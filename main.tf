# create new variables for postgresql connection
# export PGPASSWORD=S3cret2024
# export PGUSER=terraform_user

locals {
  instance_types = {
    default = "t2.micro"
    dev     = "t2.micro"
    uat     = "t2.micro"
    prod    = "t2.micro"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instance_types[terraform.workspace]

  tags = {
    Name = "Hello_World_${terraform.workspace}"
  }
}