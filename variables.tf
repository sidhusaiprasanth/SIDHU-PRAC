## VPC RELATED
variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "env" {
  type    = string
  default = "dev1"
}

variable "cluster_name" {
  type    = string
  default = "sid-k8s-cluster"
}

variable "default_tags" {
  type = map(string)
  default = {
    "Tier"       = "frontend",
    "Department" = "Finance"
  }
}

variable "pub_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "pri_subnets" {
  type    = list(string)
  default = ["10.0.100.0/24", "10.0.101.0/24", "10.0.102.0/24"]
}



## EKS RELATED

variable "cluster_version" {
  type    = string
  default = "1.25"
}

# variable "pub_subnet_ids" {
#   type = list(string)
# }

# variable "pri_subnet_ids" {
#   type = list(string)
# }


## OIDC

variable "eks_oidc_root_ca_thumbprint" {
  type    = string
  default = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}



