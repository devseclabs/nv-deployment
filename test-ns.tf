resource "kubernetes_namespace" "test-ns" {
  metadata {
    
    labels = {
      mylabel = "demo"
    }

    name = var.test-ns
  }
 
}
