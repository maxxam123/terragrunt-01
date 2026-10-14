include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${get_terragrunt_dir()}/../../../_envcommon/network/vpc.hcl"
  expose = true
}

terraform {
  source = include.envcommon.locals.base_source_url
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl")).locals
}

inputs = {
  name       = "vpc-${local.env_vars.environment}"
  cidr_block = "10.20.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.20.1.0/24", "10.20.2.0/24"]
  private_subnets = ["10.20.10.0/24", "10.20.11.0/24"]

  tags = {
    Environment = local.env_vars.environment
  }
}

