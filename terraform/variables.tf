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

variable "key_name" {
  description = "The name of the EC2 key pair to use for instances (optional)"
  type        = string
}

variable "additional_security_group_ids" {
  description = "List of additional security group IDs to attach to the EKS nodes"
  type        = list(string)
}

