# Provider
provider "aws" {
  region = "us-east-1"
}

# VPC
module "vpc" {
  source          = "./vpc"
  env             = var.env
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

# RDS
module "rds" {
  source             = "./rds"
  env                = var.env
  private_subnet_ids = module.vpc.private_subnet_ids
  db_username        = var.db_username
  db_password        = var.db_password
  vpc_id             = module.vpc.vpc_id
  db_engine             = var.engine
  db_engine_version     = var.engine_version
  db_instance_class     = var.instance_class
  db_allocated_storage  = var.allocated_storage
  
}

# elasticache
module "elasticache" {
  source             = "./elasticache"
  private_subnet_ids = module.vpc.private_subnet_ids
  env               = var.env
}

# dynamodb
module "dynamodb" {
  source = "./dynamodb"
  env    = var.env
  dynamodb_key = var.dynamodb_key
}

# SQS
module "sqs" {
  source = "./sqs"
  name_sqs = var.name_sqs
}
