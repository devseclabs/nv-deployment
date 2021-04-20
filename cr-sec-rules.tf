resource "kubernetes_cluster_role" "neuvector-cr-sec-rules" {
  metadata {
    name = "neuvector-binding-nvsecurityrules"
  }

  rule {
    api_groups = [""]
    resources  = ["nvsecurityrules","nvclustersecurityrules"]
    verbs      = ["list", "delete"]
  }
}