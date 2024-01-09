provider "aws" {
  region = "ca-central-1"
}

module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                = var.cluster_name
  subnet_ids                  = var.private_subnets
  vpc_id                      = var.vpc_id
  cluster_service_ipv4_cidr   = var.ipv4_cidr

cluster_addons = {
    coredns = {
      
      timeouts = {
        create = "25m"
        delete = "10m"
      }
    }
  }
 
 eks_managed_node_groups = {
      eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2

      instance_type = "t3a.large"
    }
  }
}

