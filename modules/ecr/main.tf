terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.7"
    }
  }
}

resource "aws_ecr_repository" "ecr" {
  name = var.ecr_name

  image_scanning_configuration {
    scan_on_push = true
  }
}
