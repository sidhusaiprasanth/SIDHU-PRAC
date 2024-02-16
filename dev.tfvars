cidr_block      = "10.0.0.0/16"
env             = "dev1"
cluster_name    = "sid-k8s-cluster"
pub_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
pri_subnets     = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]
cluster_version = "1.27"
# pub_subnet_ids              = []
# pri_subnet_ids              = []
eks_oidc_root_ca_thumbprint = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"


