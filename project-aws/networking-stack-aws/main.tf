terraform {
  backend "s3" {
    bucket       = "devops-workshop-foodzip-remote-backend"
    key          = "network/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    #dynamodb_table = "devops-workshop-foodzip-state-lock-table"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.assume_role.region
  default_tags {
    tags = var.default_tags
  }
  assume_role {
    role_arn = var.assume_role.arn
  }
}

