resource "kubernetes_service" "neuvector-controller-master-service" {
  metadata {
    name = "neuvector-service-controller-fed-master"
    namespace = var.ns
  }
  spec {
    selector = {
      app = "neuvector-controller-pod"
    }
    
    port {
      port = 11443
      name = "fed"
      protocol = "TCP"
    }

    type = "ClusterIP"
  }
  depends_on = [kubernetes_namespace.nv-ns]
}