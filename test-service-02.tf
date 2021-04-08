resource "kubernetes_service" "test-svc-02" {
  metadata {
    name = "redis"
    namespace = var.test-ns
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
  depends_on = [kubernetes_namespace.test-ns]
}