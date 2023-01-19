provider "aws" {
  region = "ap-south-1"
      access_key = "access key"
    secret_key = "secret key"
}

module "my_internet_gateway" {
    source = "./modules/nat-gateway"
    vpc_id =  module.my_vpc.vpc_id
  
}
module "my_nat_gateway" {
    source = "./modules/internet-gateway"
    subnet_id = module.my_subnet.subnet_id
    
}
module "my_vpc" {
    source = "./modules/vpc"
    
      
}
module "my_subnet" {
    source = "./modules/subnets"
    vpc_id = module.my_vpc.vpc_id
  

      
}
module "my_ec2" {
    source = "./modules/ec2"
    subnet_id = module.my_subnet.subnet_id
  
}
