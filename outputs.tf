output "cluster_id" {
  value = module.eks-cluster.cluster_id
}

output "cluster_arn" {
  value = module.eks-cluster.cluster_arn
}

output "cluster_certificate_authority_data" {
  value = module.eks-cluster.cluster_certificate_authority_data
}

output "cluster_endpoint" {
  value = module.eks-cluster.cluster_endpoint
}

output "cluster_version" {
  value = module.eks-cluster.cluster_version
}

output "cluster_iam_role_name" {
  value = module.eks-cluster.cluster_iam_role_name
}

output "cluster_iam_role_arn" {
  value = module.eks-cluster.cluster_iam_role_arn
}


output "cluster_oidc_issuer_url" {
  value = module.eks-cluster.cluster_oidc_issuer_url
}


output "cluster_primary_security_group_id" {
  value = module.eks-cluster.cluster_primary_security_group_id
}


# EKS node groups
output "node_group_public_id" {
  value = module.eks-cluster.node_group_public_id
}


output "node_group_public_arn" {
  value = module.eks-cluster.node_group_public_arn
}

output "node_group_public_status" {
  value = module.eks-cluster.node_group_public_status
}

output "node_group_public_version" {
  value = module.eks-cluster.node_group_public_version
}

output "node_group_public_release_version" {
  value = module.eks-cluster.node_group_public_release_version
}

# Private


output "node_group_private_id" {
  value = module.eks-cluster.node_group_private_id
}


output "node_group_private_arn" {
  value = module.eks-cluster.node_group_private_arn
}

output "node_group_private_status" {
  value = module.eks-cluster.node_group_private_status
}

output "node_group_private_version" {
  value = module.eks-cluster.node_group_private_version
}

output "node_group_private_release_version" {
  value = module.eks-cluster.node_group_private_release_version
}

# VPC related

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "vpc_owner_id" {
  value = module.vpc.vpc_owner_id
}

output "azs_supported_t3_medium" {
  value = module.vpc.azs_supported_t3_medium
}

output "pub_subnets_ids_list" {
  value = module.vpc.pub_subnets_ids_list
}

output "pri_subnets_ids_list" {
  value = module.vpc.pri_subnets_ids_list
}

output "pub_subnets_ids" {
  value = module.vpc.pub_subnets_ids
}

output "pri_subnets_ids" {
  value = module.vpc.pri_subnets_ids
}

output "values_pub_sub_ids" {
  value = module.vpc.values_pub_sub_ids
}

output "values_pri_sub_ids" {
  value = module.vpc.values_pri_sub_ids
}

#oidc

output "aws_iam_openid_connect_provider_arn" {
  value = module.eks-cluster.aws_iam_openid_connect_provider_arn
}


output "aws_iam_oidc_connect_provider_extract_from_arn" {
  value = module.eks-cluster.aws_iam_oidc_connect_provider_extract_from_arn
}


### add ons

output "vpccni-arn" {
  value = module.eks-cluster.vpccni-arn
}

output "vpccni-id" {
  value = module.eks-cluster.vpccni-id
}

output "vpccni-current-version" {
  value = module.eks-cluster.vpccni-current-version
}


output "aws-ebs-csi-driver-current-version" {
  value = module.eks-cluster.aws-ebs-csi-driver-current-version
}

output "coredns-current-version" {
  value = module.eks-cluster.coredns-current-version
}

output "kube-proxy-current-version" {
  value = module.eks-cluster.kube-proxy-current-version
}

