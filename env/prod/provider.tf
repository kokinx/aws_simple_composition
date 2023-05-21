provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket  = "ganghee-aws-simple-composition"
    region  = "ap-northeast-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}