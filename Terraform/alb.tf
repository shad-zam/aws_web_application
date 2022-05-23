module "alb" {
  source             = "../terraform_modules/aws-alb"
  name               = "${var.name}-app-lb"
  vpc_id             = var.create_vpc ? module.vpc.vpc_id : var.vpc_id
  subnet_ids         = var.create_vpc ? module.vpc.public_subnets : var.public_subnets_ids
  security_group_ids = [module.lb_sg.id]
}

output "loadbalancer_dns" {
  value = module.alb.alb_dns_name
}