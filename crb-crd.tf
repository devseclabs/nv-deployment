resource "kubernetes_cluster_role_binding" "neuvector-binding-customresourcedefinition" {
  metadata {
    name = "neuvector-binding-customresourcedefinition"
  }
  role_ref {
    api_group = "apiextensions.k8s.io"
    kind      = "ClusterRole"
    name      = "neuvector-binding-customresourcedefinition"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
  depends_on = [kubernetes_cluster_role.neuvector-cr-customresourcedefinition]
}
