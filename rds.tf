resource "aws_db_subnet_group" "auth_db" {
  name       = "auth-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "auth-db-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-auth-sg"
  description = "Managed by Terraform"
  vpc_id      = var.vpc_id

  tags = {
    Name = "rds-auth-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "rds_from_eks" {
  security_group_id            = aws_security_group.rds_sg.id
  referenced_security_group_id = var.eks_rds_allowed_sg_id

  ip_protocol = "tcp"
  from_port   = 5432
  to_port     = 5432

  description = "Allow PostgreSQL from EKS to RDS"
}

resource "aws_vpc_security_group_egress_rule" "rds_egress" {
  security_group_id = aws_security_group.rds_sg.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_db_instance" "targeting_db" {
  identifier = "targeting-db"

  engine         = "postgres"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "targeting_db"
  username = "targeting_user"
  password = var.targeting_db_password

  port = 5432

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  db_subnet_group_name = aws_db_subnet_group.auth_db.name
}

resource "aws_db_instance" "flag_db" {
  identifier = "flag-db"

  engine         = "postgres"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "flags_db"
  username = "flag_user"
  password = var.flag_db_password

  port = 5432

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  db_subnet_group_name = aws_db_subnet_group.auth_db.name
}

resource "aws_db_instance" "auth_db" {
  identifier = "auth-db"

  engine         = "postgres"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "auth_db"
  username = "auth_user"
  password = var.auth_db_password

  port = 5432

  publicly_accessible = false

  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  db_subnet_group_name = aws_db_subnet_group.auth_db.name
}
