resource "kubernetes_cluster_role" "neuvector-cr-sec-rules" {
  metadata {
    name = "neuvector-binding-nvsecurityrules"
  }

  rule {
    api_groups = ["neuvector.com"]
    resources  = ["nvsecurityrules","nvclustersecurityrules"]
    verbs      = ["list", "delete"]
  }
}