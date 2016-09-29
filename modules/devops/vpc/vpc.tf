variable "stack_name" {}

resource "aws_vpc" "vpc" {
  cidr_block = "10.10.0.0/19"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "${var.stack_name}-vpc"
  }
}
