# varables for the root module
variable "env" {
  type = string
}

# Variables for the vpc module
variable "vpc_cidr" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}

# Variables for the rds module

variable "db_password" {
  type = string
  sensitive = true
}

variable "db_username" {
  type = string
}

variable "engine" {
  type = string
  default = "postgres"
}
variable "engine_version" {
  type = string
  default = "16.4"
}

variable "instance_class" {
  type = string
  default = "db.t3.micro"
}
variable "allocated_storage" {
  type = number
  default = 20
  
}
