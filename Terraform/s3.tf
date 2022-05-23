module "s3" {
  source = "../terraform_modules/aws-s3"
  name = "${var.name}-s3bucket"
  force_destroy = true

  tags = {
    Owner       = "Arshad"
    Environment = "non-prod"
  }
}

output "bucket_id" {
  value = module.s3.id
}