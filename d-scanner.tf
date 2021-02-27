resource "kubernetes_deployment" "neuvector-scanner" {
  
  metadata {
    name = "neuvector-scanner-pod"
    namespace = "neuvector"

  }

  spec {
    
    replicas = var.scanner_replicas

    selector {
      match_labels = {
        app = "neuvector-scanner-pod"
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge = "1"
        max_unavailable = "0"
      }
    }

    template {
      
      metadata {
        labels = {
          app = "neuvector-scanner-pod"
        }
      }

      # TEMPLATE SPEC
      spec {
        
        image_pull_secrets {
          name  = "regsecret"
        }
        
        container {
          #TODO - CHANGE VERSION
          image = "neuvector/scanner"
          name  = "neuvector-scanner-pod"
          image_pull_policy = "Always"
    
          #ENV VARS
          env {
            name  = "CLUSTER_JOIN_ADDR"
            value = "neuvector-svc-controller.neuvector"
          }
        # Commented out sections are required only for local build-phase scanning
        /*   env {
            name  = "SCANNER_DOCKER_URL"
            value = "tcp://192.168.1.10:2376"
          }

          volume_mount {
            mount_path = "/var/run/docker.sock"
            name = "docker-sock"
            read_only = true
          }
        */
            
        } // end container
        
        restart_policy = "Always"
        # Commented out sections are required only for local build-phase scanning
        /* volume {
          name = "docker-sock"
          host_path {
            path = "/var/run/docker.sock"
          }
        } */

      } // end template spec
    
    } // end template 
  
  } // end resource spec

} // end resource