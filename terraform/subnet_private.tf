resource "aws_subnet" "public-private"{
    
    vpc_id = aws_vpc.this.id
    cidr_block= Local.vpc.cidr_subnet_private
    map_public_ip_on_Launch = false 
    availability_zone = "us-east-1b"

    tags = {
        Name="${Local.prefix}-private-subnet"
        Enviroment= Local.env
        Path = "${basename(abspath(path.module))}/subnet-private.tf"
    }

    depends_on=[
        aws_vpc.this
    ]
}