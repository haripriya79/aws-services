
resource "aws_nat_gateway" "natgatway" {
  connectivity_type = var.connection
  subnet_id         =  var.subnet_id
  tags = {
    name = var.name
  }
}