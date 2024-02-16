terraform {
  required_version = "~> 1.7.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25.2"
    }
  }
  backend "s3" {
    bucket = "sidterraformstates"
    key    = "samplejobIRSAdemo/terraform.tfstate"
    region = "ap-south-1"
  }
}




