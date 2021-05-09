terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "storage_type" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "name" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}

variable "db_port" {
  type = number
}

provider "aws" {
  region = "us-east-1"
}

module "create_vpc" {
  source = "./modules/create_vpc"
}

module "create_sg" {
  source = "./modules/create_sg"
  vpc_id = module.create_vpc.vpc_id
}

module "create_key_pair" {
  source = "./modules/create_key_pair"
}

module "create_ec2" {
  source        = "./modules/create_ec2"
  ami_id        = var.ami_id
  subnet_id     = module.create_vpc.private_subnet_1_id
  key_pair_name = module.create_key_pair.key_pair_name
  sg_id         = module.create_sg.sg_id
  instance_type = var.instance_type
}

module "create_lb" {
  source             = "./modules/create_lb"
  vpc_id             = module.create_vpc.vpc_id
  sg_id              = module.create_sg.sg_id
  public_subnet_1_id = module.create_vpc.public_subnet_1_id
  public_subnet_2_id = module.create_vpc.public_subnet_2_id
  public_subnet_3_id = module.create_vpc.public_subnet_3_id
  ec2_id             = module.create_ec2.ec2_id
}

module "create_db" {
  source               = "./modules/create_db"
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  port                 = var.db_port
  allow_https_ssh_id   = module.create_sg.sg_id
  db_subnet_group_name = module.create_vpc.db_subnet_group_name
  allow_postgres_id    = module.create_sg.allow_postgres_id
}
