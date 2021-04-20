resource "kubernetes_cluster_role_binding" "neuvector-binding-view" {
  metadata {
    name = "neuvector-binding-view"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "view"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
 
}