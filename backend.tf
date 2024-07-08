terraform {
  required_version = ">= 1.7.3"
  backend "s3" {
    profile = "home-lab"
    bucket  = "terraform-backend-luminor-test"
    key     = "terraform/network"
    region  = "us-east-1"
  }
}