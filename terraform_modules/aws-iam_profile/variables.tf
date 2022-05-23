variable "name" {
    description = "name prefix to be used for resources"
    type = string
}
variable "policies" {
    description = "list of roles to attach to IAM ROLE"
    type = list(string)
}