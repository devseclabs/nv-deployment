resource "kubernetes_cluster_role_binding" "neuvector-binding-rbac" {
  metadata {
    name = "neuvector-binding-rbac"
  }
  role_ref {
    api_group = ""
    kind      = "ClusterRole"
    name      = "neuvector-binding-rbac"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
  depends_on = [kubernetes_cluster_role.neuvector-cr-rbac]
}
