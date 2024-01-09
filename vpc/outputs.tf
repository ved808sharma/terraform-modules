# export the region
output "region" {
  value = var.region
}

# export the project name
output "project_name" {
  value = var.project_name
}

# export the environment
output "environment" {
  value = var.environment
}

# export the vpc id
output "vpc_id" {
  value = aws_vpc.vpc.id
}

# export the internet gateway
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}

# export first availability zone
output "availability_zone_1" {
  value = data.aws_availability_zones.available.names[0]
}

# export second availability zone
output "availability_zone_2" {
  value = data.aws_availability_zones.available.names[1]
}

# export public subnet az1
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

# export private app subnet az1
output "private_app_subnet_az1_id" {
  value = aws_subnet.private_app_subnet_az1.id
}

# export private data subnet az1
output "private_data_subnet_az1_id" {
  value = aws_subnet.private_data_subnet_az1.id
}

# export public subnet az2
output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

# export private app subnet az2
output "private_app_subnet_az2_id" {
  value = aws_subnet.private_app_subnet_az2.id
}

# export private data subnet az2
output "private_data_subnet_az2_id" {
  value = aws_subnet.private_data_subnet_az2.id
}