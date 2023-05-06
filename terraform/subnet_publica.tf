resource "aws_subnet" "public-subnet"{
    
    vpc_id = aws_vpc.this.id
    cidr_block= Local.vpc.cidr_subnet_public
    map_public_ip_on_Launch =true 
    availability_zone = "us-east-1a"

    tags = {
        Name="${Local.prefix}-public-subnet"
        Enviroment= Local.env
        Path = "${basename(abspath(path.module))}/subnet-public.tf"
    }

    depends_on=[
        aws_vpc.this
    ]
}