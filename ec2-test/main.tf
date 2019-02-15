module "EC2-test" {
  source          = "./../EC2-standalone"
  key_name        = "${module.key.key-name}"
  security_groups = ["${aws_security_group.sec-group.name}"]
}

module "key" {
  source             = "./../Key"
  PATH_TO_PUBLIC_KEY = "my_key.pub"
}

resource "aws_security_group" "sec-group" {
  name        = "terraform-sec-group"
  description = "security group for sshing into host."

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
