# environment variables

/* when we create variables for terraform moudles we don't write description or default value */
variable "region" {}
variable "project_name" {}
variable "environment" {} # in which we want to deploy the application in

# vpc variables
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_data_subnet_az1_cidr" {}

variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az2_cidr" {}

 





