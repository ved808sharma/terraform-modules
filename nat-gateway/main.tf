# allocate elastic ip. this eip will be used for the nat-gatway in the public subnet az1
resource "aws_eip" "eip1" {
  domain   = "vpc"
  tags = {
    Name = "${var.project_name}-${var.environment}-eip1"
  }
}

# allocate elastic ip. this eip will be used for the nat-gatway in the public subnet az2
resource "aws_eip" "eip2" {
  domain   = "vpc"
  tags = {
    Name = "${var.project_name}-${var.environment}-eip2"
  }
}

# create natgw in public subnet az1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = var.public_subnet_az1_id

  tags = {
    Name = "${var.project_name}-${var.environment}-natgw-az1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.internet_gateway]
}
 
# create natgw in public subnet az2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id =  aws_eip.eip2.id
  subnet_id     = var.public_subnet_az2_id

  tags = {
    Name = "${var.project_name}-${var.environment}-natgw-az2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.internet_gateway]
}

# create a private route table az1 and add route through natgw az1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id =  aws_nat_gateway.nat_gateway_az1.id
  }
 
  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az1" 
  }
}

# create a private route table az2 and add route through natgw az2
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id =  aws_nat_gateway.nat_gateway_az2.id
  }
 
  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az2" 
  }
}

# associate private app subnet az1 with route table az1 
resource "aws_route_table_association" "private_app_subnet_az1_rt_az1_association" {
  subnet_id      = var.private_app_subnet_az1_id
  route_table_id = aws_route_table.private_route_table_az1.id
}


# associate private data subnet az1 with route table az1
resource "aws_route_table_association" "private_data_subnet_az1_rt_az1_association" {
  subnet_id      = var.private_data_subnet_az1_id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# associate private app subnet az2 with route table az2
resource "aws_route_table_association" "private_app_subnet_az2_rt_az2_association" {
  subnet_id      =  var.private_app_subnet_az2_id
  route_table_id =  aws_route_table.private_route_table_az2.id
}

# associate private data subnet az2 with route table az2
resource "aws_route_table_association" "private_data_subnet_az2_rt_az2_association" {
  subnet_id      =  var.private_data_subnet_az2_id
  route_table_id =  aws_route_table.private_route_table_az2.id
}