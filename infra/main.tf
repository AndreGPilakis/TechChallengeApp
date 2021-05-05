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

provider "aws" {
  region = "us-east-1"
}

module "create_vpc" {
  source = "./modules/create_vpc"
}

module "create_key_pair" {
  source = "./modules/create_key_pair"
}

module "create_ec2" {
  source = "./modules/create_ec2"
  ami_id = var.ami_id
  subnet_ids = [module.create_vpc.public_subnet_1_id,module.create_vpc.public_subnet_2_id,module.create_vpc.public_subnet_3_id]
  key_pair_name = module.create_key_pair.key_pair_name
}