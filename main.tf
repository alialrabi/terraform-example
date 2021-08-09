# Terraform configuration

provider "aws" {
  region = "us-west-2"
}



module "ec2_instances" {
  source  = "./modules/ec2-instance"

}

module "vpc" {
  source  = "./modules/ec2-instance"
  
  clinic_vpc_private_subnets = module.vpc.clinic_vpc_private_subnets
  clinic_vpc_public_subnets = module.vpc.clinic_vpc_public_subnets

}
