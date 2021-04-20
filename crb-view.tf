resource "kubernetes_cluster_role_binding" "neuvector-binding-view" {
  metadata {
    name = "neuvector-binding-view"
  }
  role_ref {
    api_group = ""
    kind      = "ClusterRole"
    name      = "view"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
 
}