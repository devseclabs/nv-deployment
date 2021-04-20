resource "kubernetes_cluster_role" "neuvector-cr-rbac" {
  metadata {
    name = "neuvector-binding-rbac"
  }

  rule {
    api_groups = ["rbac.authorization.k8s.io"]
    resources  = ["rolebindings.rbac.authorization.k8s.io","roles.rbac.authorization.k8s.io","clusterrolebindings.rbac.authorization.k8s.io","clusterroles.rbac.authorization.k8s.io"]
    verbs      = ["get", "list", "watch"]
  }
}