resource "kubernetes_service" "neuvector-controller-master-service" {
  metadata {
    name = "neuvector-service-controller-fed-master"
    namespace = "neuvector"
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

    type = "LoadBalancer"
  }
}