# terraform-aws-region-prompt
example for reproducing the issue as described in https://github.com/hashicorp/terraform/issues/8680

(!) Please notice that the prompt for `provider.aws.region` will only occur if your `~./aws` credential configuration is missing the configuration for the default region. If not Terraform may silently just read and use those credentials instead of the ones declared configured in the AWS provider.

known affected terraform versions `0.7.2`, ` 0.7.3`,  `0.7.4`, `0.7.5` and `0.7.6`.

## terraform.tfvars
you'll need to create your own `terraform.tfvars` file

```hcl 
aws_region = "us-east-1"
aws_access_key = "YOURACCESSKEY"
aws_secret_key = "YOURSECRETKEY"
```

## working example (example1 folder)

open a bash shell and execute the following commands
```hcl 
cd example1
terraform get
terraform plan
```
you should get a execution plan as expected.

```hcl
+ module.vpc.vpc.aws_vpc.vpc
    cidr_block:                "10.10.0.0/19"
    default_network_acl_id:    "<computed>"
    default_route_table_id:    "<computed>"
    default_security_group_id: "<computed>"
    dhcp_options_id:           "<computed>"
    enable_classiclink:        "<computed>"
    enable_dns_hostnames:      "true"
    enable_dns_support:        "true"
    instance_tenancy:          "<computed>"
    main_route_table_id:       "<computed>"
    tags.%:                    "1"
    tags.Name:                 "terraform1-vpc"
```

## failing example (example2 folder)

open a bash shell and execute the following commands

```hcl 
cd example2
terraform get
terraform plan
```

the `plan` will not run but the terraform AWS provider will ask for `provider.aws.region`

```hcl
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Default: us-east-1
  Enter a value: 
```
