provider "aws" {
  region = "ca-central-1"
}

module "my_vpc" {
  source        = "terraform-aws-modules/vpc/aws"
  name          = "p41-vpc"
  cidr          = var.cidr
  azs           = ["ca-central-1a", "ca-central-1b"]
  private_subnets = ["192.0.1.0/24", "192.0.2.0/24"]
  public_subnets  = ["192.0.3.0/24", "192.0.4.0/24"]
  enable_nat_gateway     = true
  single_nat_gateway     = true
}
