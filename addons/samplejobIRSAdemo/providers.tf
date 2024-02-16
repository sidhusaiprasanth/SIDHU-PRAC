provider "aws" {
  region = "ap-south-1"
}

data "aws_eks_cluster" "my_eks_cluster" {
  name = data.terraform_remote_state.vpc_eks_cluster_oidc.outputs.cluster_id
}

data "aws_eks_cluster_auth" "my_eks_cluster_auth" {
  name = data.terraform_remote_state.vpc_eks_cluster_oidc.outputs.cluster_id
}


provider "kubernetes" {
  host                   = data.terraform_remote_state.vpc_eks_cluster_oidc.outputs.cluster_endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.vpc_eks_cluster_oidc.outputs.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.my_eks_cluster_auth.token
}

