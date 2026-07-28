variable "aws_region" {
  description = "AWS region usada pelo provider AWS."
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile usado pelo Terraform."
  type        = string
  default     = "ramon"
}

variable "project_name" {
  description = "Nome base do projeto para nomear recursos."
  type        = string
  default     = "toggle-master"
}

variable "eks_cluster_name" {
  description = "Nome do cluster EKS criado manualmente via eksctl."
  type        = string
}

variable "eks_nodegroup_name" {
  description = "Nome do nodegroup criado pelo eksctl."
  type        = string
}

variable "vpc_id" {
  description = "VPC onde estão EKS, RDS e Redis."
  type        = string
}

variable "eks_node_sg_id" {
  description = "Security Group dos nodes do EKS."
  type        = string
}

variable "private_subnet_ids" {
  description = "Subnets usadas por RDS e Redis."
  type        = list(string)
}

variable "auth_db_password" {
  type        = string
  sensitive   = true
  description = "Senha do banco auth."
}

variable "flag_db_password" {
  type        = string
  sensitive   = true
  description = "Senha do banco flags."
}

variable "targeting_db_password" {
  type        = string
  sensitive   = true
  description = "Senha do banco targeting."
}

variable "eks_rds_allowed_sg_id" {
  description = "Security Group do EKS autorizado a acessar os bancos RDS PostgreSQL."
  type        = string
}