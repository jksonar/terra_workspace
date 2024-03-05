terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "pg" {
    conn_str = "postgres://localhost/terraform_backend?sslmode=disable"
  }
}

provider "aws" {
  region = "us-east-2"
}

