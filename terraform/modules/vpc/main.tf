

resource "aws_vpc" "this" {
    cidr_block = "10.20.0.0/16"
    enable_dns_hostnames = true
    tags = {
        Name = "${local.name}-vpc"
        Project = var.project
        Environment = var.environment  
}
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.this.id
    cidr_block = "10.20.1.0/24"
    availability_zone = "${var.region}a"
    map_public_ip_on_launch = true
    tags = {
        Name = "${local.name}-public-subnet"}
  
}



resource "aws_subnet" "private" {
    vpc_id = aws_vpc.this.id
    cidr_block = "10.20.11.0/24"
    availability_zone = "${var.region}a"
    tags = {
        Name = "${local.name}-private-subnet"}
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_subnet.public.vpc_id
    tags = {
        name = "igw"
    }
  
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.this.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${local.name}-rtb-public"}
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
} 


# Nat Gateway for private subnet
# resource "aws_eip" "nat" {
#     domain = "vpc"
#     tags = {
#         Name = "${local.name}-nat-eip"}
# }

# resource "aws_nat_gateway" "this" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public.id
#   tags = {
#     Name = "${local.name}-nat"
# }
# }

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.this.id
    # route {
    #     cidr_block = "0.0.0.0/0"
    #     nat_gateway_id = aws_nat_gateway.this.id
    # }
    tags = {
        Name = "${local.name}-rtb-private"}
  
}

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
} 