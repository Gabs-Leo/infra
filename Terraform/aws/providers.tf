terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }

  backend "s3" {
    bucket         = "test-gabrial-taveira-terraform-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-2"
 }
}

provider "aws" {
  region = "us-east-2"
}
