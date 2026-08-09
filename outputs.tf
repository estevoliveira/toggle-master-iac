output "aws_caller_identity_command" {
  description = "Run this command to verify which AWS identity Terraform will use."
  value       = "aws sts get-caller-identity --profile ${var.aws_profile}"
}

output "eks_node_role_name" {
  description = "IAM Role detectada automaticamente a partir do nodegroup do EKS."
  value       = local.eks_node_role_name
}

output "auth_rds_endpoint" {
  value = aws_db_instance.auth_db.endpoint
}

output "flag_rds_endpoint" {
  value = aws_db_instance.flag_db.endpoint
}

output "targeting_rds_endpoint" {
  value = aws_db_instance.targeting_db.endpoint
}

output "redis_url" {
  value = "redis://${aws_elasticache_replication_group.redis.primary_endpoint_address}:6379"
}

output "sqs_queue_url" {
  value = aws_sqs_queue.feature_evaluation_events.url
}

output "sqs_queue_arn" {
  value = aws_sqs_queue.feature_evaluation_events.arn
}