resource "aws_vpc" "test-vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.tenancy
  tags = {
    name = var.name
  }
}
