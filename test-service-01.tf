resource "kubernetes_service" "test-svc-01" {
  metadata {
    name = "nginx-webui"
    namespace = var.test-ns
  }
  spec {
    selector = {
      app = "nginx-pod"
    }
    
    port {
      port = 80
      name = "webui"
      protocol = "TCP"
    }

    type = "NodePort"
  }
  depends_on = [kubernetes_namespace.test-ns]

  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/devseclabs/nv-deployment/main/crd/test-rules.yml"
  }
}