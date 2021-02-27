resource "kubernetes_service" "neuvector-admission-service" {
  metadata {
    name = "neuvector-svc-admission-webhook"
    namespace = "neuvector"
  }
  spec {
    selector = {
      app = "neuvector-controller-pod"
    }
    
    port {
      port = 443
      target_port = "20443"
      name = "admission-webhook"
      protocol = "TCP"
    }

    type = "ClusterIP"
  }
}