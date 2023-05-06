resource "aws_eip" "nat"{
    vpc= true

    tags={
        Name ="${Local.prefix}-nat-eip"
        Enviroment = Local.env
        Path = "${basename(abspath(path.module))}/natg.tf"
    }
    
}

resource "aws_nat_gateway" "nat"{
    subnet_id ="${aws_subnet.public-subnet.id}"
    allocation_id= aws_eip-nat.id

    tags ={
        Name = "${Local.prefix}-nat-gateway"
        Enviroment = Local.env
        Path = "${basename(abspath(path.module))}/natg.tf"
    }

    depends_on =[ aws_internet_gateway.this]
}