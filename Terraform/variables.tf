##### VPC Vars ##########

variable "create_vpc" {
  description = "Determines whether vpc will be created. if false then you have to pass already available vpc details"
  type        = bool
}

variable "region" {
  description = "Region to create the resources"
  type        = string
}

variable "name"{
    description = "The name to be used on all resources"
    type = string
}

variable "cidr"{
    description = "cidr range for the new VPC to create"
    type = string
    default = ""
}

variable "private_subnets_cidrs"{
    description = "cidr ranges for the new private subnets"
    type = list(string)
    default = []
}

variable "public_subnets_cidrs"{
    description = "cidr ranges for the new public subnets"
    type = list(string)
    default = []
}

variable "vpc_id"{
    description = "If using the already available VPC. please provide the VPC to be used"
    type = string
    default = ""
}

variable "private_subnets_ids"{
    description = "If using the already available VPC. please provide the list of private subnets to be used"
    type = list(string)
    default = []
}

variable "public_subnets_ids"{
    description = "If using the already available VPC. please provide the list of public subnets to be used"
    type = list(string)
    default = []
}

############# Auto Scalling Group ##############

variable "min_size"{
    description = "Auto scalling group minimum size"
    type = number
}

variable "max_size"{
    description = "Auto scalling group max size"
    type = number
}

variable "desired_capacity"{
    description = "Auto scalling group desired capacity"
    type = number
}

variable "wait_for_elb_capacity"{
    description = "Auto scalling group creation will wait untill minimum instances to be available for ALB"
    type = number
}

variable "wait_for_capacity_timeout"{
    description = "Auto scalling group wait_for_elb_capacity timeout period"
    type = string
    default = "15m"
}

variable "key_name"{
    description = "SSH key to be assinged to instances lauched by ASG"
    type = string
}

variable "target_value"{
    description = "Target CPU value for Scalling operations"
    type = number
    
}


