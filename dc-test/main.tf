provider "aws" {}

resource "aws_instance" "dc_test_box" {
  ami                  = "ami-01e24be29428c15b2"
  instance_type        = "t2.micro"
  iam_instance_profile = "docker-logs"
  key_name             = "rickyg"
  security_groups      = ["launch-wizard-4"]
}

output "public_dns" {
  value       = "${aws_instance.dc_test_box.public_dns}"
  description = "Public DNS"
}
