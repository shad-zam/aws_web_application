module "app_svr_sg" {
  source      = "../terraform_modules/aws-sg"
  name        = "${var.name}-app-server-sg"
  description = "application server sg"
  vpc_id      = var.create_vpc ? module.vpc.vpc_id : var.vpc_id
  port_sg = {
    "80"  = [module.lb_sg.id]
    "443" = [module.lb_sg.id]
  }
  tags = {
    Owner       = "Arshad"
    Environment = "non-prod"
  }
}

module "lb_sg" {
  source      = "../terraform_modules/aws-sg"
  name        = "${var.name}-ALB-sg"
  description = "Load Balancer sg"
  vpc_id      = var.create_vpc ? module.vpc.vpc_id : var.vpc_id
  port_cidr = {
    "80"  = ["0.0.0.0/0"]
    "443" = ["0.0.0.0/0"]
  }

  tags = {
    Owner       = "Arshad"
    Environment = "non-prod"
  }

}