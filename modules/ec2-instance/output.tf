
output "clinic_vpc_id" {
    description = "VPC ID"
    value = module.vpc.vpc_id
}


output "clinic_vpc_private_subnets" {
    description = "List of private subnets"
    value = module.vpc.private_subnets
}

output "clinic_vpc_public_subnets" {
    description = "List of private subnets"
    value = module.vpc.public_subnets
}
