output "aws_account_id" {
  description = "The AWS account ID where the resources are being provisioned."
  value       = data.aws_caller_identity.current.account_id
}