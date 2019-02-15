resource "aws_security_group" "sec-group" {
  name        = "${var.name}"
  description = "security group for sshing into host."
}
