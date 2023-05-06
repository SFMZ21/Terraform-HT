resource "aws_eip" "nat"{
    vpc= true

    tags={
        Name ="${local.prefix}-nat-eip"
        Enviroment = local.env
        Path = "${basename(abspath(path.module))}/natg.tf"
    }
    
}

resource "aws_nat_gateway" "natg-rt"{
    subnet_id ="${aws_subnet.public-subnet.id}"
    allocation_id= aws_eip.nat.id

    tags ={
        Name = "${local.prefix}-nat-gateway"
        Enviroment = local.env
        Path = "${basename(abspath(path.module))}/natg.tf"
    }

    depends_on =[ aws_internet_gateway.this]
}