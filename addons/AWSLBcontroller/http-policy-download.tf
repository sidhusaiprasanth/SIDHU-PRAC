data "http" "lbc_iam_policy" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"

  request_headers = {
    Accept = "application/json"
  }
}

output "lbc_iam_policy" {
  value = data.http.lbc_iam_policy.response_body
}

