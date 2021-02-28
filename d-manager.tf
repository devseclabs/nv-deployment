resource "kubernetes_deployment" "neuvector-manager" {
  
  metadata {
    name = "neuvector-manager-pod"
    namespace = "neuvector"

  }

  spec {
    
    replicas = 1

    selector {
      match_labels = {
        app = "neuvector-manager-pod"
      }
    }

    template {
      
      metadata {
        labels = {
          app = "neuvector-manager-pod"
        }
      }

      # TEMPLATE SPEC
      spec {
        
        image_pull_secrets {
          name  = "regsecret"
        }
        
        container {
          #TODO - CHANGE VERSION
          image = "neuvector/manager:${var.nv_version}"
          name  = "neuvector-manager-pod"
    
          #ENV VARS
          env {
            name  = "CTRL_SERVER_IP"
            value = "neuvector-svc-controller.neuvector"
          }
           
        } // end container

        restart_policy = "Always"
        
      } // end template spec
    
    } // end template 
  
  } // end resource spec
  depends_on = [kubernetes_namespace.nv-ns]

} // end resource