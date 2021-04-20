resource "kubernetes_cluster_role" "neuvector-cr-customresourcedefinition" {
  metadata {
    name = "neuvector-binding-customresourcedefinition"
  }

  rule {
    api_groups = ["rbac.authorization.k8s.io"]
    resources  = ["customresourcedefinitions"]
    verbs      = ["get", "create", "watch"]
  }
}