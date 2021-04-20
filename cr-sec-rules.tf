resource "kubernetes_cluster_role" "neuvector-cr-sec-rules" {
  metadata {
    name = "neuvector-binding-nvsecurityrules"
  }

  rule {
    api_groups = ["rbac.authorization.k8s.io"]
    resources  = ["nvsecurityrules","nvclustersecurityrules"]
    verbs      = ["list", "delete"]
  }
}