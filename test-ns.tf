resource "kubernetes_namespace" "nv-ns" {
  metadata {
    
    labels = {
      mylabel = "demo"
    }

    name = var.test-ns
  }
}