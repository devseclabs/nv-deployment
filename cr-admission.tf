resource "kubernetes_cluster_role" "neuvector-cr-admission" {
  metadata {
    name = "neuvector-binding-admission"
  }

  rule {
    api_groups = ["admissionregistration.k8s.io"]
    resources  = ["validatingwebhookconfigurations","mutatingwebhookconfigurations"]
    verbs      = ["get", "list", "watch","update","create","delete"]
  }
}