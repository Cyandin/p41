provider "aws" {
  region = "us-central-1"
}

module "eks_cluster" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = var.cluster_name
  subnets      = var.private_subnets
  vpc_id       = var.vpc_id

  cluster_create_timeout = "30m"
  cluster_delete_timeout = "30m"

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2

      instance_type = "t3a.large"

      key_name = var.key_name  # Optional: If you use a key pair for SSH access

      additional_security_group_ids = var.additional_security_group_ids
    }
  }
}

