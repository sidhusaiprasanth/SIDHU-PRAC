terraform {
  required_version = "~> 1.7.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.36.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
  backend "s3" {
    bucket = "sidterraformstates"
    key    = "addons/argocd/terraform.tfstate"
    region = "ap-south-1"
  }

}

provider "aws" {
  region = "ap-south-1"
}

provider "http" {

}

### Data Source remote

data "terraform_remote_state" "my_eks_cluster" {
  backend = "s3"
  config = {
    bucket = "sidterraformstates"
    key    = "final/terraform.tfstate"
    region = "ap-south-1"
  }
}


## Declare other providers

data "aws_eks_cluster" "my_eks_cluster" {
  name = data.terraform_remote_state.my_eks_cluster.outputs.cluster_id
}


data "aws_eks_cluster_auth" "my_eks_cluster_auth" {
  name = data.terraform_remote_state.my_eks_cluster.outputs.cluster_id
}


provider "kubernetes" {
  host                   = data.terraform_remote_state.my_eks_cluster.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.my_eks_cluster.outputs.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.my_eks_cluster_auth.token
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.my_eks_cluster.outputs.cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.my_eks_cluster.outputs.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.my_eks_cluster_auth.token
  }
}



