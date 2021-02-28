resource "kubernetes_service" "neuvector-crd-service" {
  metadata {
    name = "neuvector-svc-crd-webhook"
    namespace = "neuvector"
  }
  spec {
    selector = {
      app = "neuvector-controller-pod"
    }
    
    port {
      port = 443
      target_port = "30443"
      name = "crd-webhook"
      protocol = "TCP"
    }

    type = "ClusterIP"
  }
  depends_on = [kubernetes_namespace.nv-ns]
}