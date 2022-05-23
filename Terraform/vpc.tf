

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../terraform_modules/aws-vpc"

  create_vpc = var.create_vpc

  name = var.name
  cidr = var.cidr


  private_subnets = var.private_subnets_cidrs
  public_subnets  = var.public_subnets_cidrs

  tags = {
    Owner       = "Arshad"
    Environment = "non-prod"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}