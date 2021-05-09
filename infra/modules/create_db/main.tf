
variable "storage_type"{
  type = string
}
variable "engine"{
  type = string
}
variable "engine_version"{
  type = string
}
variable "instance_class"{
  type = string
}
variable "name"{
  type = string
}
variable "username"{
  type = string
}
variable "password"{
  type = string
  sensitive = true
}
variable "port" {
    type = number
}

variable "db_subnet_group_name"{
    type = string
}

variable "allow_https_ssh_id"{
  type = string
}

variable "allow_postgres_id"{
  type = string
}
resource "aws_db_instance" "data" {
  allocated_storage    = 20
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  port                 = 5432
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.allow_postgres_id, var.allow_https_ssh_id]
}

output "db_endpoint"{
  value = aws_db_instance.data.endpoint
}

output "db_user"{
  value = aws_db_instance.data.username
}

output "db_password"{
  value = aws_db_instance.data.password
  sensitive = true
}