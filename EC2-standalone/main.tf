resource "aws_instance" "EC2" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
  key_name      = "${var.key_name}"
}
