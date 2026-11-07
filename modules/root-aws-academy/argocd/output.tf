output "argocd_namespace" {
  value = helm_release.argocd.namespace
}

output "argocd_release_name" {
  value = helm_release.argocd.name
}

output "argocd_chart_version" {
  value = helm_release.argocd.version
}