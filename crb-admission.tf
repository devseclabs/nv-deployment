resource "kubernetes_cluster_role_binding" "neuvector-binding-admission" {
  metadata {
    name = "neuvector-binding-admission"
  }
  role_ref {
    api_group = ""
    kind      = "ClusterRole"
    name      = "neuvector-binding-admission"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
  depends_on = [kubernetes_cluster_role.neuvector-cr-admission] 
}
