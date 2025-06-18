terraform {
  backend "s3" {
    bucket         = "235494779082-aftbootstrap-tfstate"
    key            = "state/terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "ddb-aftbootstrap-state"
  }
}