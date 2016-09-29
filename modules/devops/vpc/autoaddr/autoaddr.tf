variable "stack_name" {}

module "vpc" {
  source = "../"
  stack_name = "${var.stack_name}"
}
