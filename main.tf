module "vpc" {
  source       = "git::https://github.com/sidhusaiprasanth/vpc"
  cidr_block   = var.cidr_block
  env          = var.env
  cluster_name = var.cluster_name
  default_tags = var.default_tags
  pub_subnets  = var.pub_subnets
  pri_subnets  = var.pri_subnets
}


module "eks-cluster" {
  depends_on      = [module.vpc]
  source          = "git::https://github.com/sidhusaiprasanth/eks-cluster-2024"
  env             = var.env
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  pub_subnet_ids  = module.vpc.pub_subnets_ids_list
  pri_subnet_ids  = module.vpc.pri_subnets_ids_list
  default_tags    = var.default_tags

}

