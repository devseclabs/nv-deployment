resource "kubernetes_service" "test-svc-02" {
  metadata {
    name = "redis"
  }
  spec {
    selector = {
      app = "redis-pod"
    }
    
    port {
      port = 6379
      name = "redis"
      protocol = "TCP"
    }

    type = "NodePort"
  }
}