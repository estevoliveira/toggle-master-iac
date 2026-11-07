variable "argocd_chart_version" {
  description = "Versão do Helm Chart do Argo CD"
  type        = string
}

variable "service_type" {
  description = "Tipo de serviço Kubernetes do Argo CD"
  type        = string
  default     = "LoadBalancer"
}