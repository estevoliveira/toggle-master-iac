data "aws_eks_node_group" "current" {
  cluster_name    = var.eks_cluster_name
  node_group_name = var.eks_nodegroup_name
}

locals {
  eks_node_role_name = split("/", data.aws_eks_node_group.current.node_role_arn)[1]
}