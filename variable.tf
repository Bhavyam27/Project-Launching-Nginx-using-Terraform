variable "ec2_instance_type" {
default = "t3.micro"
type = string
}

variable "aws_root_size"{
default = 10
type = number
}

variable "ec2_ami_id"{
default = "ami-043339ea831b48099"
type = string
}
