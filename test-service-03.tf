resource "kubernetes_service" "test-svc-03" {
  metadata {
    name = "node"
    namespace = var.test-ns
  }
  spec {
    selector = {
      app = "node-pod"
    }
    
    port {
      port = 8888
      name = "node"
      protocol = "TCP"
    }

    type = "NodePort"
  }
}