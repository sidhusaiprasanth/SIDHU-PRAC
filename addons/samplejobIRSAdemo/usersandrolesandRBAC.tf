## ADMIN USER #########################

resource "aws_iam_user" "admin_user" {
  name          = "eksadmin1"
  force_destroy = true
  path          = "/"
  tags          = var.default_tags
}


resource "aws_iam_user_policy_attachment" "admin_user_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = aws_iam_user.admin_user.name
}


######### BASIC USER #########################

resource "aws_iam_user" "basic_user" {
  name          = "basicuser1"
  force_destroy = true
  path          = "/"
  tags          = var.default_tags
}


resource "aws_iam_user_policy" "basic_user_policy_eks" {
  name = "eks-full-acccess-policy"
  user = aws_iam_user.basic_user.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "iam:ListRoles",
          "eks:*",
          "ssm:GetParameter"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

########### Get AWS Account ###

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# ######### configmap aws-auth

# locals {
#   configmap_roles = [
#     {
#       rolearn  = "${aws_iam_role.this_eks_node_group_role.arn}"
#       username = "system:node:{{EC2PrivateDNSName}}"
#       groups   = ["system:bootstrappers", "system:nodes"]
#     }
#   ]
#   configmap_users = [
#     {
#       userarn  = "${aws_iam_user.admin_user.arn}"
#       username = "${aws_iam_user.admin_user.name}"
#       groups   = ["system:masters"]
#     },
#     {
#       userarn  = "${aws_iam_user.basic_user.arn}"
#       username = "${aws_iam_user.basic_user.name}"
#       groups   = ["system:masters"]
#     }
#   ]
# }

# resource "kubernetes_config_map_v1" "aws_auth" {
#   depends_on = [aws_eks_cluster.this_aws_eks_cluster]
#   metadata {
#     name      = "aws-auth"
#     namespace = "kube-system"
#   }

#   data = {
#     mapRoles = yamlencode(local.configmap_roles)
#     mapUsers = yamlencode(local.configmap_users)
#   }
# }

