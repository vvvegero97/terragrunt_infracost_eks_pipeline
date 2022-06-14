variable "s3_bucket_name" {
  description = "S3 bucket for holding Terraform state. Must be globally unique."
  type        = string
  default     = "vegero-terragrunt-tfstate-bucket"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table for locking Terraform states"
  type        = string
  default     = "terragrunt_tfstate_aws_eu_north_1"
}
