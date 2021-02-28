resource "kubernetes_service" "neuvector-manager-service" {
  metadata {
    name = "neuvector-service-webui"
    namespace = "neuvector"
  }
  spec {
    selector = {
      app = "neuvector-manager-pod"
    }
    
    port {
      port = 8443
      name = "manager"
      protocol = "TCP"
    }

    type = var.webui_svc_type
  }
  depends_on = [kubernetes_namespace.nv-ns]
}