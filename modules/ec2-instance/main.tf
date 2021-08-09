# Terraform configuration

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  name           = "my-ec2-cluster"
  instance_count = 1

  ami                    = "ami-0c5204531f799e0c6"
  instance_type          = "t2.micro"
  subnet_ids              = module.vpc.public_subnets
  
  user_data                   = data.template_cloudinit_config.cloudinit_portal.rendered
  
  vpc_security_group_ids      = [aws_security_group.clinic_sg.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_security_group" "clinic_sg" {
  vpc_id          = var.clinic_vpc_id
  name_prefix     = "tf-allow-http-elb"
  description     = "security group that allows ssh and all egress traffic"

  lifecycle {
    create_before_destroy = true
  }
  ingress {
      from_port   = var.ec2_internal_ssh_port
      to_port     = var.ec2_internal_ssh_port
      protocol    = "tcp"
      cidr_blocks = [var.clinic_vpc_cidr]
  }  
  ingress {
      from_port   = 8081
      to_port     = 8081
      protocol    = "tcp"
      cidr_blocks = [var.clinic_vpc_cidr]
  }  
  egress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { 

  }
}
