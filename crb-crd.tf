resource "kubernetes_cluster_role_binding" "neuvector-binding-customresourcedefinition" {
  metadata {
    name = "neuvector-binding-customresourcedefinition"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "neuvector-binding-customresourcedefinition"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "neuvector"
    namespace = "default"
  }
  depends_on = [kubernetes_cluster_role.neuvector-binding-customresourcedefinition]
}
