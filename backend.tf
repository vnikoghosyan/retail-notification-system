terraform {
  backend "s3" {
    bucket         = "aca-training-tf-backend"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    key            = "aca-training-tf-backend/homework/aca-terraform-states.tfstate"
    region         = "us-east-1"
  }
}