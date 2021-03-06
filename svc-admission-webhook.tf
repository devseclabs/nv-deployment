resource "kubernetes_service" "neuvector-admission-service" {
  metadata {
    name = "neuvector-svc-admission-webhook"
    namespace = var.ns
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
  depends_on = [kubernetes_namespace.nv-ns]
}