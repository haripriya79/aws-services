

resource "aws_instance" "mywebsite-1" {
    count = 1
    ami = var.ami
    instance_type = var.instance-type
    subnet_id = var.subnet_id
    
   
    tags = {
        Name = var.name
    }
}