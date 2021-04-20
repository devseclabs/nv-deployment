resource "kubernetes_cluster_role_binding" "neuvector-binding-nvsecurityrules" {
  metadata {
    name = "neuvector-binding-nvsecurityrules"
  }
  role_ref {
    api_group = ""
    kind      = "ClusterRole"
    name      = "neuvector-binding-nvsecurityrules"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
 
}