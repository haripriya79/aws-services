
variable "subnet_id" {
    type = string
  
}
variable "name" {
  default = "natgateway"
}

variable "connection" {
    default = "private"
    type = string
  
}