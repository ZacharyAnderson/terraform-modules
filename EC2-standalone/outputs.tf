output "public-ip" {
  value = "${aws_instance.EC2.public_ip}"
}
