locals {
  base_source_url = "${get_terragrunt_dir()}/../../../../infrastructure-modules//vpc"
}

inputs = {
  tags = {
    ManagedBy = "Terragrunt"
  }
}

