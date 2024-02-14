## PUT TERRAFORM CLOUD BLOCK HERE!  ##
terraform {
  cloud {
    organization = "aws-cicd"
    workspaces {
      name = "tf-cloud-aws"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.01"
    }
  }
}


# Variable blocks directly within the main.tf. No arguments necessary.
# variable "aws_access_key" {}
# variable "aws_secret_key" {}
variable "region" {}
variable "vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "azs" {}

# provider arguments call on the variables which then call on terraform.tfvars for the values.
provider "aws" {
  # it's a not a good practise to hardcord the credentials
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  region = var.region
}

# create a aws vpc
# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"
#   # To download the latest module, simply omit the version argument. 
#   # However, if you wanted a specific module version, you could list it as shown below.
#   # This version was released in 2023.
#   version            = "4.0.2"
#   name               = "bot-vpc"
#   azs                = var.azs
#   cidr               = var.vpc_cidr
#   public_subnets     = var.public_subnets
#   private_subnets    = var.private_subnets
#   enable_nat_gateway = true
#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_instance" "bot-server" {
#   ami                    = "ami-0c7c4e3c6b4941f0f"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [module.vpc.default_security_group_id]
#   subnet_id              = module.vpc.public_subnets[0]

#   tags = {
#     Name = "TC-triggered-instance"
#   }
# }
