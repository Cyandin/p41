module "my_eks_cluster" {
  source      = "./eks-module"
  vpc_id      = "vpc-0dd9880eb96354c16"
  cluster_name = "my_eks_cluster"
  private_subnets = ["subnet-05e3236054c7d0853", "subnet-0a3dd63e625135a8c", "subnet-0e46c7cd67f6c04f7"]
}

