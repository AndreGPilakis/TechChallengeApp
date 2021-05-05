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