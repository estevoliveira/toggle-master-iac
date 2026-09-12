# Provider
provider "aws" {
  region = var.region
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
  rds_databases = var.rds_databases

  source = "./rds"
  env    = var.env
  #db_name              = each.value
  private_subnet_ids   = module.vpc.private_subnet_ids
  db_username          = var.db_username
  db_password          = var.db_password
  vpc_id               = module.vpc.vpc_id
  db_engine            = var.engine
  db_engine_version    = var.engine_version
  db_instance_class    = var.instance_class
  db_allocated_storage = var.allocated_storage
}
