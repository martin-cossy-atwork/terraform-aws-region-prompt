#
# This is a simple working example
#

# :: init
variable "aws_access_key" {} # terraform.tfvars
variable "aws_secret_key" {} # terraform.tfvars
variable "aws_region" {} # terraform.tfvars

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

# :: code
variable "stackname" { default = "terraform1" }

module "vpc" {
  source = "../modules/devops/vpc/autoaddr"
  stack_name = "${var.stackname}"
}
