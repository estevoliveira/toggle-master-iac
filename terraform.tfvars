aws_region  = "us-east-1"
aws_profile = "ramon"

project_name = "toggle-master"

eks_cluster_name   = "togg-cluster"
eks_nodegroup_name = "workers"

vpc_id = "vpc-03c5c612a34cd4539"

eks_node_sg_id        = "sg-04b935519a9a65e1e"
eks_rds_allowed_sg_id = "sg-04b935519a9a65e1e"

private_subnet_ids = [
  "subnet-028466efc8fb80dd3", 
  "subnet-02d60984f3cb31e04"
]

auth_db_password      = "auth_password"
flag_db_password      = "flag_password"
targeting_db_password = "targeting_password"

