terraform {
  backend "s3" {
    bucket         = "rally-control-terraform-state-3126899190-eu-west-2"
    key            = "dev/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "rally-control-terraform-locks"
    encrypt        = true
  }
}