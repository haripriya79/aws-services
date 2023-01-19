# variable "ami" {
#     value="ami-0e472ba40eb589f49"
  
# }


variable "instance-type" { 
	type    = string
	default = "t2.micro" 
}

variable "subnet_id" {
	type = string
}



variable "ami" {
	type = string
	default = "ami-052cef05d01020f1d"
}
variable "name" {
	type = string
	default = "ubuntu-1"
}