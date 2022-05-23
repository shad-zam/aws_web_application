variable "create_s3" {
  description = "Controls if S3 bucket should be created"
  type        = bool
  default     = true
}

variable "enable_default_enc" {
  description = "Controls if default encryption should be enabled on bucket"
  type        = bool
  default     = true
}
variable "enable_versioning" {
  description = "Controls if versioning should be enabled for bucket or not"
  type        = bool
  default     = false
}


variable "name" {
  description = "The name of the bucket. (forces new resource, default: unique random name)"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to bucket"
  type        = map(string)
  default     = {}
}

variable "acl" {
  description = "The canned ACL to apply. https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl"
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
  default     = false
}
