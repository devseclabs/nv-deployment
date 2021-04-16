resource "kubernetes_deployment" "test-deployment-03" {
  metadata {
    name = "node-pod"
    namespace = var.test-ns
  }

  spec {
    replicas = var.test_replicas

    selector {
      match_labels = {
        app = "node-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "node-pod"
        }
      }

      spec {
        container {
          image = "nvbeta/node"
          name  = "node-pod"
         
        }
      }
    }
  }
  depends_on = [kubernetes_namespace.test-ns]
   
}
