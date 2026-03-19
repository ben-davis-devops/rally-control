variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "The environment name"
  type        = string
  default     = "dev"
}