resource "aws_route_table" "route"{
    vpc_id= "${aws_vpc.this.id}"

    route{
        cidr_block= "0.0.0.0/0"
        gateway_id ="${aws_internet_gateway.this.id}"
    }

    tags ={
        using_case= "acceso a internet"
        Name= "${Local.prefix}-route-table-public"
        Enviroment= Local.env
        Path = "${basename(abspath(path.module))}/route-table-ig.tf"
    }
}

resource "aws_route_table_association" "rt"{
    subnet_id = "${aws_subnet.public-subnet.id}"
    rout_table_id = "${aws_route_table.route.id}"
}