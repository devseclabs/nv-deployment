resource "kubernetes_namespace" "nv-ns" {
  metadata {
    
    labels = {
      mylabel = "neuvector"
    }

    name = var.ns
  }
}