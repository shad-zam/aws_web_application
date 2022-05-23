output "id" {
  description = "The name of the bucket."
  value       = aws_s3_bucket.mybucket.*.id
}

output "arn" {
  description = "The ARN of the bucket."
  value       = aws_s3_bucket.mybucket.*.arn
}

output "bucket_domain_name" {
  description = "The domain name of the bucket."
  value       = aws_s3_bucket.mybucket.*.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "The region-specific domain name of the bucket."
  value       = aws_s3_bucket.mybucket.*.bucket_regional_domain_name
}

output "hosted_zone_id" {
  description = "The Route 53 Hosted Zone ID for this bucket's region."
  value       = aws_s3_bucket.mybucket.*.hosted_zone_id
}

output "region" {
  description = "The AWS region this bucket resides in."
  value       = aws_s3_bucket.mybucket.*.region
}