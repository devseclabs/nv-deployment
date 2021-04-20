resource "kubernetes_cluster_role" "neuvector-cr-app" {
  metadata {
    name = "neuvector-binding-app"
  }

  rule {
    api_groups = ["rbac.authorization.k8s.io"]
    resources  = ["namespaces", "pods", "nodes","services"]
    verbs      = ["get", "list", "watch","update"]
  }
}