resource "aws_route_table" "private-natg"{
    vpc_id= "${aws_vpc.this.id}"

    route{
        cidr_block= "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.natg-rt.id
    }

    tags ={
        using_case= "nat gateway"
        Name= "${local.prefix}-route-table-private"
        Enviroment= local.env
        Path = "${basename(abspath(path.module))}/route-table-natg.tf"
    }
}

resource "aws_route_table_association" "rt-nat"{
    subnet_id = "${aws_subnet.private-subnet.id}"
    route_table_id = "${aws_route_table.private-natg.id}"
}