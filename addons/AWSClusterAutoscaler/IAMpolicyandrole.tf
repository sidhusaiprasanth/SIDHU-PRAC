resource "aws_iam_policy" "AmazonEKSClusterAutoscalerPolicy" {
  name = "AmazonEKSClusterAutoscalerPolicy"
  path = "/"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeTags",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeLaunchTemplateVersions",
          "ec2:DescribeInstanceTypes"
        ],
        "Resource" : "*",
        "Effect" : "Allow"
      }
    ]
  })
}



resource "aws_iam_role" "cluster_autoscaler_iam_role" {
  name = "cluster-autoscaler"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated = "${data.terraform_remote_state.my_eks_cluster.outputs.aws_iam_openid_connect_provider_arn}"
        }
        Condition = {
          StringEquals = {
            "${data.terraform_remote_state.my_eks_cluster.outputs.aws_iam_oidc_connect_provider_extract_from_arn}:sub" : "system:serviceaccount:kube-system:cluster-autoscaler"
          }
        }
      },
    ]
  })
}


resource "aws_iam_role_policy_attachment" "cluster_autoscaler_iam_role-policy-attach" {
  policy_arn = aws_iam_policy.AmazonEKSClusterAutoscalerPolicy.arn
  role       = aws_iam_role.cluster_autoscaler_iam_role.name
}

output "cluster_autoscaler_iam_role_arn" {
  value = aws_iam_role.cluster_autoscaler_iam_role.arn
}


