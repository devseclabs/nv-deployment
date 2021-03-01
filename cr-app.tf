resource "kubernetes_cluster_role" "neuvector-cr-app" {
  metadata {
    name = "neuvector-binding-app"
  }

  rule {
    api_groups = [""]
    resources  = ["namespaces", "pods", "nodes","services"]
    verbs      = ["get", "list", "watch","update"]
  }
}