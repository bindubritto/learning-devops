provider "aws" {
  region = "us-east-1"
}


resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source = "./modules/subnet"

  subnet_cidr_block = var.subnet_cidr_block
  vpc_id = aws_vpc.myapp-vpc.id
  avail_zone = var.avail_zone
  env_prefix = var.env_prefix
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
}


module "myapp-server" {
  source = "./modules/webserver"

  avail_zone = var.avail_zone
  vpc_id = aws_vpc.myapp-vpc.id
  my_ip = var.my_ip
  env_prefix = var.env_prefix
  public_key_location = var.public_key_location
  instance_type = var.instance_type
  subnet_id = module.myapp-subnet.subnet.id
}

# resource "aws_route_table" "myapp-route-table" {
#   vpc_id = aws_vpc.myapp-vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.myapp-igw.id
#   }

#   tags = {
#     Name: "${var.env_prefix}-igw"
#   }
# }

# resource "aws_route_table_association" "a-rtb-subnet" {
#   subnet_id = aws_subnet.myapp-subnet-1.id
#   route_table_id = aws_route_table.myapp-route-table.id
# }



# resource "aws_security_group" "myapp-sg" {
#   name = "myapp-sg"
#   vpc_id = aws_vpc.myapp-vpc.id

#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = [var.my_ip]
#   }

#   ingress {
#     from_port = 8080
#     to_port = 8080
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     prefix_list_ids = [] // allowing access to vpc endpoints
#   }

#   tags = {
#     Name: "${var.env_prefix}-sg"
#   }
# }

