resource "aws_key_pair" "EC2-key-pair" {
  key_name   = "MyKey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
