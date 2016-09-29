#
# This is failing example based on the working example 1
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
module "example2_failing" {
  source = "../modules/example2_failing"
  aws_region = "${var.aws_region}"
}
