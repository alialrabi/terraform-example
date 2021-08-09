# Input variable definitions

variable "clinic_vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "example-vpc"
}

variable "clinic_vpc_id" {
    description   = "ID of VPC"
    type          = string
    default       = ""
}

variable "clinic_vpc_cidr" {
    description   = "VPC CIDR block"
    type          = string
    default       = "10.0.0.0/16"
}

variable "clinic_vpc_private_subnets" {
    description   = "Public subnets for VPC"
    type          = list
   # default       = []
}

variable "clinic_vpc_public_subnets" {
  description = "Private subnets for VPC"
  type        = list
 # default       = []
}

variable "clinic_vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "ec2_internal_ssh_port" {
    description   = "Public ssh key"
    type          = number
    default       = 22
}

