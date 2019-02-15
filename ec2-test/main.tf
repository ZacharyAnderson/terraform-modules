module "EC2-test" {
  source   = "./../EC2-standalone"
  key_name = "${module.key.key-name}"
}

module "key" {
  source             = "./../Key"
  PATH_TO_PUBLIC_KEY = "my_key.pub"
}
