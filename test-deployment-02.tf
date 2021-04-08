resource "kubernetes_deployment" "test-deployment-02" {
  metadata {
    name = "redis-pod"
    namespace = var.test-ns
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "redis-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "redis-pod"
        }
      }

      spec {
        container {
          image = "redis"
          name  = "redis-pod"
         
        }
      }
    }
  }
}