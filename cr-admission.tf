resource "kubernetes_cluster_role" "neuvector-cr-admission" {
  metadata {
    name = "neuvector-binding-admission"
  }

  rule {
    api_groups = [""]
    resources  = ["validatingwebhookconfigurations","mutatingwebhookconfigurations"]
    verbs      = ["get", "list", "watch","update","create","delete"]
  }
}