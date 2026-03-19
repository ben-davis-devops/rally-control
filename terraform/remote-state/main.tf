resource "aws_s3_bucket" "tf_state" {
  bucket = "rally-control-terraform-state-3126899190-eu-west-2" // S3 bucket names must be globally unique.

  tags = {
    Name        = "terraform-state"
    Environment = "dev"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_sse" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "rally-control-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  tags = {
    Name        = "terraform-locks"
    Environment = "dev"
  }

  attribute {
    name = "LockID"
    type = "S"
  }
}