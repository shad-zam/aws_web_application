# aws_web_application

This repository has terraform configuration files to create a simple webserver
on AWS using terraform

The Webserver will simply output hello with the hostname of the server

## Prerequisites

Terraform version 13 or higher should be installed on the running machine 
A key pair should be created prior to running the scripts and name should be provided as a variable

## Resources

apart from the key pair for servers all other resources will be created with the provided terraform configuraions. below are the list of resources which can be created using the scripts.
VPC with S3 endpoint
public subnets (with igw)
private subnets (with natgw)
security groups
Autoscalling group with defined metrics
IAM role for instances
S3 bucket

All the resource creation are written as terraform modules which can be easily re-used for future requirments.

### options

You have two option. you can either create the VPC with subnets to be used for application or you can utilize the already avaialable VPC to host the application.

#### with VPC
set the create_vpc variable to true and provide the CIDR range for the VPC and subnets. the number of subnets will depend on the number of CIDR's provided.

#### without VPC

set the create_vpc variable to false and provide the already available VPC id and subnet ID's

## How to run 

1. clone this repository 
2. goto Terraform directory
3. create a tfvar file with required variables
(Refer 'with_vpc.tfvar' to create with a vpc & 'without_vpc.tfvar' file for create without vpc)
4. Run 'terraform init' to innitiate the terraform
5. Run 'terraform plan -out=terraform.provisionplan -var-file=<created_tfvar.file>'
eg- $ terraform plan -out=terraform.provisionplan -var-file=inputs.tfvar
6. Run 'terraform apply "terraform.provisionplan" ' 
This will create the exact same as the plan output which got desplayed.
7. Run 'terraform destroy -var-file=<created_tfvar.file>' - This will destroy the created infrastructure. 
eg - $ terraform destroy -var-file=inputs.tfvar


## Important information

1. This will create a http webserver which will be open to the public internet.
2. When creating with VPC make sure to pass valid CIDR ranges for vpc & subnets.