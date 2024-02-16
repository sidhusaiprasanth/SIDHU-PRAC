resource "helm_release" "metrics_server_release" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
}

output "metrics_server_release_helm-metadata" {
  value = helm_release.metrics_server_release.metadata
}

