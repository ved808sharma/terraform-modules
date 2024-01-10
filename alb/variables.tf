# environments variables
variable "region" {}
variable "project_name" {}
variable "environment" {}

#alb variables
variable "alb_security_group_id" {}
variable "vpc_id" {}
variable "certificate_arn" {}
variable "public_subnet_az1_id" {}
variable "public_subnet_az2_id" {}
variable "target_type" {}