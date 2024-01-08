output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks_cluster.cluster_id
}

output "eks_node_group_ids" {
  description = "The IDs of the EKS node groups"
  value       = module.eks_cluster.node_group_ids
}

