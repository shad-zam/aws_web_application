data "aws_ami" "amzn_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0*-x86_64-gp2"]
  }
}

module "asg" {
  depends_on = [
    module.instance_profile
  ]
  source                    = "../terraform_modules/aws-asg"
  name                      = "${var.name}-appsvr-asg"
  vpc_zone_identifier       = var.create_vpc ? module.vpc.private_subnets : var.private_subnets_ids
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  target_group_arns         = [module.alb.default_target_group_arn]
  image_id                  = data.aws_ami.amzn_ami.id
  security_groups           = [module.app_svr_sg.id]
  user_data_base64          = filebase64("../scripts/user_data.sh")
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  iam_instance_profile_arn  = module.instance_profile.arn
  key_name                  = var.key_name
  target_value              = var.target_value

   tags = {
     "Owner"       = "Arshad"
     "Environment" = "non-prod"
   }
}
