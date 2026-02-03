terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu-west"
}

resource "aws_s3_bucket" "us_east_1" {
  bucket = "some-random-bucket-name-lhawpfiuhwn"
}

resource "aws_s3_bucket" "eu_west_1" {
  bucket   = "some-random-bucket-name-98234598712"
  provider = aws.eu-west
}