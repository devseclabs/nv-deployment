resource "kubernetes_cluster_role_binding" "neuvector-binding-app" {
  metadata {
    name = "neuvector-binding-app"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "neuvector-binding-app"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
 depends_on = [kubernetes_cluster_role.neuvector-cr-app]
}
