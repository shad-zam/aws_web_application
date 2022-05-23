resource "aws_s3_bucket" "mybucket" {
  count = var.create_s3 ? 1 : 0

  bucket              = var.name
  tags                = var.tags
  force_destroy       = var.force_destroy

}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
    count  = var.create_s3 && var.enable_default_enc ? 1 : 0
    bucket = aws_s3_bucket.mybucket[0].bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_acl" "mybucket" {
    count = var.create_s3 ? 1 : 0
  bucket = aws_s3_bucket.mybucket[0].id
  acl = var.acl
}

resource "aws_s3_bucket_versioning" "mybucket" {
  count = var.create_s3 && var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.mybucket[0].id

  versioning_configuration {
    status = "Enabled"
  }
}