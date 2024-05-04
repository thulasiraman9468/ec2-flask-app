provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "rama" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.rama.id
    cidr_block = "10.0.1.0/24"
    # tags = {
    #     Name = Main
    # }  
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.rama.id
  tags = {
    Name = "Main"
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.rama.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
resource "aws_route_table_association" "route" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.route.id
}
resource "aws_security_group" "sw" {
  vpc_id = aws_vpc.rama.id
  name = "sw"
  description = "Security group"
  ingress {
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "EC2"
  }
}
