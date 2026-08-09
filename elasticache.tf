resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.project_name}-redis-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-redis-subnet-group"
  }
}

resource "aws_security_group" "redis_sg" {
  name        = "${var.project_name}-redis-sg"
  description = "Allow Redis access from EKS"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-redis-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "redis_from_eks" {
  security_group_id            = aws_security_group.redis_sg.id
  referenced_security_group_id = var.eks_node_sg_id

  ip_protocol = "tcp"
  from_port   = 6379
  to_port     = 6379

  description = "Allow Redis from EKS nodes"
}

resource "aws_vpc_security_group_egress_rule" "redis_egress" {
  security_group_id = aws_security_group.redis_sg.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id = "${var.project_name}-redis"
  description          = "Redis cache for toggle-master services"

  engine         = "redis"
  engine_version = "7.1"
  node_type      = "cache.t3.micro"

  port               = 6379
  num_cache_clusters = 1

  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis_sg.id]

  automatic_failover_enabled = false
  multi_az_enabled           = false

  at_rest_encryption_enabled = true
  transit_encryption_enabled = false

  apply_immediately = true

  tags = {
    Name = "${var.project_name}-redis"
  }
}