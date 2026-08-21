remote_state {
  backend = "s3"
  config = {
    bucket = "challenge3-terraform-state"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
terraform {
  source = "../../modules/root"
}

inputs = {

  env             = "dev"
  
  #vpc insputs
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]
  azs = ["us-east-1a", "us-east-1b"]

  #rds auth-service inputs
  db_username = "teste"
  db_password = "123456678"
  instance_class = "db.t3.micro"
  engine_version = "16.10"

  #dynamodb_table
  dynamodb_key = "event_id"

  #SQS
  name_sqs = "toggle-master-sqs"
}

