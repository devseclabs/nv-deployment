resource "kubernetes_role_binding" "admin" {
  metadata {
    name      = "neuvector-admin"
    namespace = var.ns
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = "admin"
  }
 
  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "neuvector"
  }
  depends_on = [kubernetes_namespace.nv-ns]
}