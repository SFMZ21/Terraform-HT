resource "aws_route_table" "route"{
    vpc_id= "${aws_vpc.this.id}"

    route{
        cidr_block= "0.0.0.0/0"
        gateway_id ="${aws_internet_gateway.this.id}"
    }

    tags ={
        using_case= "internet gateway"
        Name= "${local.prefix}-route-table-public"
        Enviroment= local.env
        Path = "${basename(abspath(path.module))}/route-table-ig.tf"
    }
}

resource "aws_route_table_association" "rt"{
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.route.id}"
}