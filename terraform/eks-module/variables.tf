variable "vpc_id" {
  description = "The ID of the VPC where the EKS cluster will be deployed"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs in which EKS nodes will be launched"
  type        = list(string)
}

