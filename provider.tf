provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      ManagedBy   = "terraform"
      Project     = "cloud-deep-dive"
    }
  }
}