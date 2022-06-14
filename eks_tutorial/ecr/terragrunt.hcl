terraform {
  source = "../../modules//ecr/"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  ecr_name = "vegero-tg-ecr"
}