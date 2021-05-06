# Create EC2 instance and key pair
variable "ami_id"{
    type = string
}

variable "subnet_id"{
    type = string
}

variable "key_pair_name"{
    type = string
}

variable "sg_id"{
    type = string
}

variable "instance_type"{
    type = string
}
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = var.key_pair_name
  security_groups = [var.sg_id]
}

output "ec2_id"{
    value = aws_instance.web.id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}