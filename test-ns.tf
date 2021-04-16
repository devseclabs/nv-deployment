resource "kubernetes_namespace" "test-ns" {
  metadata {
    
    labels = {
      mylabel = "demo"
    }

    name = var.test-ns
  }
}
provisioner "local-exec" {
    command = "kubectl -f testpod-crd.yaml"
  }
