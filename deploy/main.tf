terraform {
  backend "s3" {
    bucket         = "terraform-state-lw72"
    key            = "terraform-state-lw72.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.19.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}

locals {
  prefix     = "${var.prefix}-${terraform.workspace}"
  account_id = data.aws_caller_identity.current.account_id
}