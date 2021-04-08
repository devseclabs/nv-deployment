resource "kubernetes_service" "neuvector-controller-worker-service" {
  metadata {
    name = "neuvector-service-controller-fed-worker"
    namespace = var.ns
  }
  spec {
    selector = {
      app = "neuvector-controller-pod"
    }
    
    port {
      port = 10443
      name = "fed"
      protocol = "TCP"
    }

    type = "ClusterIP"
  }
  depends_on = [kubernetes_namespace.nv-ns]
}