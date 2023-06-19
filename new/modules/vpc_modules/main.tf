

resource "aws_vpc" "myvpc"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = "true"
    enable_dns_support = "true"

    tags = {
        Name = "${var.project_name}-vpc"
    }
}

resource "aws_internet_gateway" "myigw" {
    vpc_id = aws_vpc.myvpc.id
     
    tags = {
        Name = "${var.project_name}-igw"
    }

}
data "aws_availability_zones" "availabilty_zones"{

}

resource "aws_subnet" "public"{
    cidr_block = cidrsubnet("${var.vpc_cidr}",8,1)
    vpc_id = aws_vpc.myvpc.id
    availability_zone = data.aws_availability_zones.availabilty_zones.names[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "${var.project_name}-public_subnet"
    }
}
resource "aws_route_table" "public_route_table"{
    vpc_id = aws_vpc.myvpc.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id  = aws_internet_gateway.myigw.id
    }

    tags {
        Name = "public_route_table"
    }
}

resource "aws_route_table_association" "public_subnet_route_table_association"{
    subnet_id = aws_subnet.public_.id
    route_table_id = aws_route_table.public_route_table.id
}


resource "aws_subnet" "private"{
    cidr_block = cidrsubnet("${var.vpc_cidr}",8,2)
    vpc_id = aws_vpc.myvpc.id
    availability_zone = data.aws_availability_zones.availabilty_zones.names[0]
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.project_name}-private_subnet"
    }
}
