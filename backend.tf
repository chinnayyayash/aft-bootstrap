# Create S3 Bucket for Terraform state
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "983491056145-aftbootstrap-tfstate"
 
  lifecycle {
    prevent_destroy = true
  }
}
 
# Enable Versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
 
  versioning_configuration {
    status = "Enabled"
  }
}
 
# Create Server-Side Encryption Configuration for the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
 
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
 
# Create DynamoDB Table for state locking
resource "aws_dynamodb_table" "terraform_state_locks" {
  name         = "ddb-aftbootstrap-state"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
 
  attribute {
    name = "LockID"
    type = "S"
  }
}

# Configure Terraform to use the S3 bucket and DynamoDB table for state management
terraform {
  backend "s3" {
    bucket         = "983491056145-aftbootstrap-tfstate"
    key            = "aft-bootstrap/state_file/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "ddb-aftbootstrap-state"
  }
}