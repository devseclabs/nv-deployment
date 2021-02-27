resource "kubernetes_service" "neuvector-controller-ports-service" {
  metadata {
    name = "neuvector-svc-controller"
    namespace = "neuvector"
  }
  spec {
    selector = {
      app = "neuvector-controller-pod"
    }
    
    cluster_ip = "None"

    port {
      port = 18300
      name = "cluster-tcp-18300"
      protocol = "TCP"
    }

     port {
      port = 18301
      name = "cluster-tcp-18301"
      protocol = "TCP"
    }

     port {
      port = 18301
      name = "cluster-udp-18301"
      protocol = "UDP"
    }
   
  }
}