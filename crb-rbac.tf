resource "kubernetes_cluster_role_binding" "neuvector-binding-rbac" {
  metadata {
    name = "neuvector-binding-rbac"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "neuvector-binding-rbac"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "neuvector"
    namespace = "default"
  }
  depends_on = [kubernetes_cluster_role.neuvector-binding-rbac]
}
