provider "aws" {
 region = "eu-north-1"
}

# Creating a key-pair.

resource "aws_key_pair" "my_key" {
  key_name   = "my_terraform"
  public_key = file("my_key.pub")
}

#Creating a default VPC

resource aws_default_vpc default {
  
}


#Creating a  security group

resource "aws_security_group" "my_tls" {
  name        = "my_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id

ingress {
  cidr_blocks = ["0.0.0.0/0"]
  from_port  = 80
  protocol = "tcp"
  to_port  = 80
}

ingress {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 22
  protocol = "tcp"
  to_port     = 22
}

egress {

from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]

}
}

# Creating an Ec2 instance

resource "aws_instance" "my_instance"{

key_name = "my_key"
vpc_security_group_ids = [aws_security_group.my_tls.id]
ami = var.ec2_ami_id
user_data = file("nginx.sh")
instance_type = var.ec2_instance_type
associate_public_ip_address = true
root_block_device{
volume_size = var.aws_root_size
volume_type = "gp3"
}

tags = {
Name = "TWS another world"
       }

}
