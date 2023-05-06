resource "aws_route_table" "private-natg"{
    vpc_id= "${aws_vpc.this.id}"

    route{
        cidr_block= "0.0.0.0/0"
        gateway_id ="${aws_nat_gateway.this.id}"
    }

    tags ={
        using_case= "nat gateway"
        Name= "${Local.prefix}-route-table-private"
        Enviroment= Local.env
        Path = "${basename(abspath(path.module))}/route-table-natg.tf"
    }
}

resource "aws_route_table_association" "rt"{
    subnet_id = "${aws_subnet.private-subnet.id}"
    rout_table_id = "${aws_route_table.private-natg.id}"
}