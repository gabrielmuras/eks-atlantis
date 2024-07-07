provider "aws" {
  region  = "us-east-1"
  profile = "home-lab"
}

terraform {
  required_version = ">= 1.7.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.57.0"
    }
  }
}