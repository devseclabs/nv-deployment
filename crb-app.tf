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
    name      = "neuvector"
    namespace = "default"
  }
 depends_on = [kubernetes_cluster_role.neuvector-binding-app]
}
