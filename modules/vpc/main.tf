terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.7"
    }
  }
}

locals {
  cidr_part = trimsuffix(var.cidr, ".0.0")
  name      = "vegero-eks"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "3.2.0"
  name            = "${var.deployment_prefix}-VPC"
  cidr            = "${var.cidr}/16"
  azs             = data.aws_availability_zones.available.names
  private_subnets = ["${local.cidr_part}.1.0/24", "${local.cidr_part}.2.0/24", "${local.cidr_part}.3.0/24"]
  public_subnets  = ["${local.cidr_part}.4.0/24", "${local.cidr_part}.5.0/24", "${local.cidr_part}.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  # enable_flow_log                      = true
  # create_flow_log_cloudwatch_iam_role  = true
  # create_flow_log_cloudwatch_log_group = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/internal-elb"     = 1
  }
  tags = {
    Example    = "${var.deployment_prefix}-additional"
    GithubRepo = "terraform-aws-eks"
    GithubOrg  = "terraform-aws-modules"
  }
}

