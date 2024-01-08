provider "aws" {
  region = "ca-central-1"
}

module "my_vpc" {
  source        = "terraform-aws-modules/vpc/aws"
  name          = "p41-vpc"
  cidr          = "10.0.0.0/16"
  azs           = ["ca-central-1a", "ca-central-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  enable_nat_gateway     = true
  single_nat_gateway     = true
}

module "my_eks_cluster" {
  source            = "./eks-module"
  vpc_id            = module.my_vpc.vpc_id
  cluster_name      = "my-eks-cluster"
  private_subnets   = module.my_vpc.private_subnets
}

