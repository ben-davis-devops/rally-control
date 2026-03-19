output "aws_account_id" {
  description = "The AWS account ID where the resources are being provisioned."
  value       = data.aws_caller_identity.current.account_id
}

output "tf_state_bucket_arn" {
  description = "The ARN of the S3 bucket used for Terraform remote state storage."
  value       = aws_s3_bucket.tf_state_bucket.arn
}

output "tf_state_bucket_name" {
  description = "The name of the S3 bucket used for Terraform remote state storage."
  value       = aws_s3_bucket.tf_state_bucket.bucket
}

output "tf_state_lock_table_arn" {
  description = "The ARN of the DynamoDB table used for Terraform state locking."
  value       = aws_dynamodb_table.tf_state_lock_table.arn
}

output "tf_state_lock_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking."
  value       = aws_dynamodb_table.tf_state_lock_table.name
}
