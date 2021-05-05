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

resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  subnet_id       = ""
  key_name        = var.key_pair_name
  security_groups = ""
}
