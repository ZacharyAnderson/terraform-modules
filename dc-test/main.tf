provider "aws" {}

resource "aws_instance" "dc_test_box" {
  ami                  = "ami-061392db613a6357b"
  instance_type        = "t2.micro"
  iam_instance_profile = "docker-logs"
  key_name             = "rickyg"
  security_groups      = ["launch-wizard-4"]
  user_data            = "${file("./dave-ec2-start.sh")}"

  provisioner "local-exec" {
    command = <<EOT
      echo "Host dc-test2" >> ~/.ssh/config
      echo "    HostName" "${aws_instance.dc_test_box.public_dns}" >> ~/.ssh/config
      echo "    User ec2-user" >> ~/.ssh/config
      echo "    IdentityFile ~/workspace/misc/rickyg.pem" >> ~/.ssh/config
    EOT
  }
}

output "public_dns" {
  value       = "${aws_instance.dc_test_box.public_dns}"
  description = "Public DNS"
}
