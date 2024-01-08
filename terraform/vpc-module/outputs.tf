output "vpc_id" {
  description = "VPC"
  value       = module.my_vpc.vpc_id
}
output "private_subnets" {
  description = "Subnets"
  value       = module.my_vpc.private_subnets
}

