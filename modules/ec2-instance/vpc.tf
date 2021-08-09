provider "aws" {
  region = "us-west-2"
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = var.clinic_vpc_name
  cidr = "10.10.0.0/16"

  azs             = var.clinic_vpc_azs
  
  private_subnets     = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets      = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}
