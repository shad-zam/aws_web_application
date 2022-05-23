module "instance_profile" {
  source = "../terraform_modules/aws-iam_profile"
  name = var.name
  policies = ["AmazonEC2RoleforSSM","AmazonS3ReadOnlyAccess"]
}

output "profile_id" {
  value = module.instance_profile.id
}