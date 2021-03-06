resource "kubernetes_deployment" "test-deployment-01" {
  metadata {
    name = "nginx-pod"
    namespace = var.test-ns
  }

  spec {
    replicas = var.test_replicas

    selector {
      match_labels = {
        app = "nginx-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx-pod"
        }
      }

      spec {
        container {
          image = "nvbeta/swarm_nginx"
          name  = "nginx-pod"
          port {
            container_port = 80
            protocol = "TCP"
          }
        }
      }
    }
  }
  depends_on = [kubernetes_namespace.test-ns]
}