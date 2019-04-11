module "EC2-test" {
  source          = "./../EC2-standalone"
  key_name        = "${module.key.key-name}"
  security_groups = ["${module.sec-group.name}"]
  user_data       = "${file("./intializatiion_script.sh")}"
}

module "key" {
  source             = "./../Key"
  PATH_TO_PUBLIC_KEY = "my_key.pub"
}

module "sec-group" {
  name   = "my-security-group"
  source = "./../sec-group"
}

module "ingress-22" {
  source            = "./../sec-group-rule"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = "${module.sec-group.id}"
}

module "ingress-80" {
  source            = "./../sec-group-rule"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = "${module.sec-group.id}"
}

module "egress-all" {
  source            = "./../sec-group-rule"
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = "${module.sec-group.id}"
}
