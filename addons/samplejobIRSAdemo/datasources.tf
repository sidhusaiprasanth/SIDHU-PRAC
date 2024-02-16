data "terraform_remote_state" "vpc_eks_cluster_oidc" {
  backend = "s3"
  config = {
    bucket = "sidterraformstates"
    key    = "final/terraform.tfstate"
    region = "ap-south-1"
  }
}


