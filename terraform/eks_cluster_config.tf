terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
  backend "s3" {
    bucket         = "cngtfstate"
    key            = "terraform/terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locking"
  }
}

provider "aws" {
  region = "ca-central-1"
}

module "my_vpc" {
  source                = "./vpc-module"
  name                  = "p41-vpc"
  cidr                  = "192.168.0.0/17"
  secondary_cidr_blocks = ["192.168.128.0/17"]
  azs                   = ["ca-central-1a", "ca-central-1b"]
  private_subnets       = ["192.168.1.0/24", "192.168.2.0/24", "192.168.129.0/24", "192.168.130.0/24"]
  public_subnets        = ["192.168.3.0/24", "192.168.4.0/24"]
}

module "my_eks_cluster" {
  source                     = "./eks-module"
  vpc_id                     = module.my_vpc.vpc_id
  cluster_name               = "my_eks_cluster"
  private_subnets            = module.my_vpc.private_subnets
  ipv4_cidr                  = "192.168.129.0/24" 
}

