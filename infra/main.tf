terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"
}

module "create_vpc" {
  source = "./modules/create_vpc"
}

module "create_ec2" {
  source = "./modules/create_vpc"
}