terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.0"
  }
 }
}

provider "aws" {
  region = "ca-central-1"
}

module "my_vpc" {
  source        = "terraform-aws-modules/vpc/aws"
  name          = "p41-vpc"
  cidr          = "192.0.0.0/16"
  azs           = ["ca-central-1a", "ca-central-1b"]
  private_subnets = ["192.0.1.0/24", "192.0.2.0/24"]
  public_subnets  = ["192.0.3.0/24", "192.0.4.0/24"]
}

module "my_eks_cluster" {
  source            = "./eks-module"
  vpc_id            = module.my_vpc.vpc_id
  cluster_name      = "my_eks_cluster"
  private_subnets   = module.my_vpc.private_subnets
}

