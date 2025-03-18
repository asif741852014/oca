resource "aws_vpc" "vpc16" {
    cidr_block = var.vpcidr
    tags = {
        Name = var.vpcname
    }
}

resource "aws_internet_gateway" "igw16" {
    vpc_id = aws_vpc.vpc16.id
    tags = {
        Name = var.igw
    }
}

data "aws_availabilty_zones" "az" {}



resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc16.id
    cidr_block = var.subnetcidr_az1
    availability_zone = data.aws_availabilty_zones.az[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "sn1"
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.vpc16.id
    cidr_block = var.subnetcidr_az2
    availability_zone = data.aws_availabilty_zones.az[1]
    map_public_ip_on_launch = true

    tags = {
        Name = "sn2"
    }
}


resource "aws_route_table" "rt16" {
    vpc_id = aws_vpc.vpc16.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw16.id
    }
  
}


resource "aws_route_table_association" "assrnsn1" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rt16.id
}

resource "aws_route_table_association" "assrnsn2" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.rt16.id
}