

resource "aws_launch_template" "this" {
  count = var.create_lt ? 1 : 0

  name        = "${var.name}-lt"

  ebs_optimized = var.ebs_optimized
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data_base64

  vpc_security_group_ids = var.security_groups
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  iam_instance_profile {
    arn = var.iam_instance_profile_arn
  }

  tags = merge(
    { "Name" = var.name },
    var.tags,
  )
}

################################################################################
# Autoscaling group
################################################################################

resource "aws_autoscaling_group" "this" {
  count = var.create_asg ? 1 : 0

  name        = var.name


  launch_template {
      id    = aws_launch_template.this[0].id
  }

  vpc_zone_identifier = var.vpc_zone_identifier

  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  capacity_rebalance        = var.capacity_rebalance
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  default_cooldown          = var.default_cooldown
  protect_from_scale_in     = var.protect_from_scale_in
  target_group_arns         = var.target_group_arns
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period
  termination_policies  = var.termination_policies
  service_linked_role_arn = var.service_linked_role_arn

  # tags = var.tags
  

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_policy" "this" {
  count                  = var.create_asg ? 1 : 0
  name                   = "${var.name}-scalling-policy"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.this[0].name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_value
  }
}