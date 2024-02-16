resource "helm_release" "loadbalancer_controller" {
  depends_on = [aws_iam_role.AmazonEKSLoadBalancerControllerRole]
  name       = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"

  namespace = "kube-system"

  set {
    name  = "image.repository"
    value = "602401143452.dkr.ecr.ap-south-1.amazonaws.com/amazon/aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.create"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.AmazonEKSLoadBalancerControllerRole.arn
  }

  set {
    name  = "vpcId"
    value = data.terraform_remote_state.my_eks_cluster.outputs.vpc_id
  }

  set {
    name  = "region"
    value = "ap-south-1"
  }

  set {
    name  = "clusterName"
    value = data.terraform_remote_state.my_eks_cluster.outputs.cluster_id
  }

}
