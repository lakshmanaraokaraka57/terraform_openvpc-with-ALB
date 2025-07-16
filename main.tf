resource "aws_security_group" "sg" {
    name="${local.resource_name}-alb"
    description = "Lasya Infotech Company Security Group Rules"
    vpc_id = aws_vpc.main.id
    tags=merge(
        var.common_tags,
        {
            Name=local.resource_name
        }
    )
    ingress {
      from_port=80
      to_port=80
      protocol="tcp"
      cidr_blocks=["0.0.0.0/0"]
    }
  egress {
    from_port=0
    to_port=0
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"]
    
    
  }
}
// SG for ALB--> EC2
resource "aws_security_group" "sg_ec2" {
    name="${local.resource_name}-ec2"
    description = "Lasya Infotech Company Security Group Rules"
    vpc_id = aws_vpc.main.id
    tags=merge(
        var.common_tags,
        {
            Name=local.resource_name
        }
    )
    ingress {
      from_port=0
      to_port=0
      protocol="-1"
      //cidr_blocks=[aws_security_group.sg.id]
      security_groups = [aws_security_group.sg.id]
    }
  egress {
    from_port=0
    to_port=0
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"]
    
    
  }
}

// VPC creation for lasya-infotech
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags=merge(
    var.common_tags,
    {
      Name=local.resource_name
    }
  )
  
}
// Public Subnet creation
resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1a"
  cidr_block = var.cidr_block[0]
  map_public_ip_on_launch = true
  tags=merge(
    var.common_tags,
    {
      Name="${local.resource_name}-pub-1a"
    }
  )
  
}
resource "aws_subnet" "public2" {
  vpc_id = aws_vpc.main.id
  availability_zone = "ap-south-1b"
  cidr_block = var.public2_cidr_block[0]
  map_public_ip_on_launch = true
  tags=merge(
    var.common_tags,
    {
      Name="${local.resource_name}-pub-1b"
    }
  )
  
}

// Private subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_cidr_block[0]
  map_public_ip_on_launch = true
  tags=merge(
    var.common_tags,
    {
      Name="${local.resource_name}-private"
    }
  )
  
}
//Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags=merge(
    var.common_tags,
    {
      Name="IGW-${local.resource_name}"
    }
  )
  
}
// Route Table Creation
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags=merge(
    var.common_tags,
    {
      Name="RT-${local.resource_name}-Public"
    }
  )
  
}
resource "aws_route_table" "public2" {
  vpc_id = aws_vpc.main.id
  tags=merge(
    var.common_tags,
    {
      Name="RT-${local.resource_name}-Public2"
    }
  )
  
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags=merge(
    var.common_tags,
    {
      Name="RT-${local.resource_name}-private"
    }
  )
  
}
// Routeing
resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
resource "aws_route" "public2" {
  route_table_id            = aws_route_table.public2.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
// Subnet Association
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
  
}
resource "aws_route_table_association" "public2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.public2.id
  
}
resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
  
}