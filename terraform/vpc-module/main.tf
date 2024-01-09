provider "aws" {
  region = "ca-central-1"
}

module "my_vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  name                   = var.name
  cidr                   = var.cidr
  secondary_cidr_blocks  = var.secondary_cidr_blocks
  azs                    = var.azs
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
}
