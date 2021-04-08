resource "kubernetes_service" "test-svc-01" {
  metadata {
    name = "nginx-webui"
    namespace = var.test-ns
  }
  spec {
    selector = {
      app = "nginx-pod"
    }
    
    port {
      port = 80
      name = "webui"
      protocol = "TCP"
    }

    type = "NodePort"
  }
}