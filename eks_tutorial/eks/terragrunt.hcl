terraform {
    source = "../../modules//eks"
}

include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path                             = "../network/vpc/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"] # Configure mock outputs for the "init", "validate", "plan" commands that are returned when there are no outputs available (e.g the module hasn't been applied yet.)
  mock_outputs = {
    vpc_id          = "vpc-fake-id"
    private_subnets = ["subnet-fake-ids"]
  }
}

dependency "sg" {
  config_path                             = "../network/sg/"
  mock_outputs_allowed_terraform_commands = ["init", "validate", "plan", "terragrunt-info", "show"] # Configure mock outputs for the "init", "validate", "plan" commands that are returned when there are no outputs available (e.g the module hasn't been applied yet.)
  mock_outputs = {
    sg_ids          = ["sg-fake-id-1", "sg-fake-id-2"]
  }
}

inputs = {
  cluster_name = "vegero-eks"
  vpc_id       = dependency.vpc.outputs.vpc_id
  subnet_ids   = dependency.vpc.outputs.private_subnets
  sg_id        = dependency.sg.outputs.sg_id
}