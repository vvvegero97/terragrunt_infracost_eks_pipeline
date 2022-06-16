variable "cluster_name" {
  description = "Name of AWS EKS Cluster"
  type        = string
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "AWS VPC Private Subnet ids"
  type        = list(string)
}

variable "sg_ids" {
  description = "AWS SG IDs"
  type        = list(string)
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "178112661675",
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::178112661675:user/viachaslau.viahera@effective-soft.com"
      username = "viachaslau.viahera@effective-soft.com"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::178112661675:user/terraformuser"
      username = "terraformuser"
      groups   = ["system:masters"]
    },
  ]
}
