resource "aws_vpc" "this"{
    cidr_block =Local.vpc.cidr
    instance_tenancy="default"

    tags={
        Name="${Local.prefix}-vpc"
        Enviroment= Local.env
        Path = "${basename(abspath(path.module))/vpc.tf}"
    }
}