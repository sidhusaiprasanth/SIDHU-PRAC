data "aws_eks_addon_version" "default" {
  addon_name         = "vpc-cni"
  kubernetes_version = "1.25"
}

data "aws_eks_addon_version" "latest" {
  addon_name         = "vpc-cni"
  kubernetes_version = "1.25"
  most_recent        = true
}

# resource "aws_eks_addon" "vpc_cni" {
#   cluster_name  = aws_eks_cluster.example.name
#   addon_name    = "vpc-cni"
#   addon_version = data.aws_eks_addon_version.latest.version
# }

output "default" {
  value = data.aws_eks_addon_version.default.version
}

output "latest" {
  value = data.aws_eks_addon_version.latest.version
}
