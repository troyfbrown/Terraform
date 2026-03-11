terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# AMI ID - us-east-1: ami-04680790a315cd58d
# AMI ID - eu-west-1: ami-09d0c9a85bf1b9ea7
provider "aws" {
  region = "us-east-1"
}
