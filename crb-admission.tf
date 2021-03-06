resource "kubernetes_cluster_role_binding" "neuvector-binding-admission" {
  metadata {
    name = "neuvector-binding-admission"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "neuvector-binding-admission"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "neuvector"
    namespace = "default"
  }
  depends_on = [kubernetes_cluster_role.neuvector-cr-admission] 
}
