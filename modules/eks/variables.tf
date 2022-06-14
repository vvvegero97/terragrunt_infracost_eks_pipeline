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
