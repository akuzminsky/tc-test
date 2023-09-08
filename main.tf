data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnets" "current" {}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  subnet_id = data.aws_subnets.current.ids[0]
  instance_type = "t3.micro"

  tags = {
    Name = "ByeWorld"
  }
}
