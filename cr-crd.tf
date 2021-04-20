resource "kubernetes_cluster_role" "neuvector-cr-customresourcedefinition" {
  metadata {
    name = "neuvector-binding-customresourcedefinition"
  }

  rule {
    api_groups = [""]
    resources  = ["customresourcedefinitions"]
    verbs      = ["get", "create", "watch"]
  }
}