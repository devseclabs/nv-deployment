resource "kubernetes_cron_job" "neuvector-updater" {
  
  metadata {
    name = var.resource_name
    namespace = var.ns
  }
  
  spec {
   
    schedule = var.cron
        
    job_template {
      
      metadata {
          labels = {
            "app" = var.resource_name
          }
      }
      
      spec {
        #backoff_limit              = 2
        #ttl_seconds_after_finished = 10
        
        template {
        
          metadata {}
          spec {
            
            image_pull_secrets {
              name  = var.docker_secret
            }
            
            container {
              
              name    = var.resource_name
              image   = var.image_name
              image_pull_policy = "Always"
              #TODO - fix command
              command = var.commands
              
              env {
                name  = "CLUSTER_JOIN_ADDR"
                value = "neuvector-svc-controller.neuvector"
              }
              
                         
            } // end container
          
             restart_policy = "Never" 
          } // end template spec

        } // end template
      
      } // end job spec
    
    } // end job template 
  
  } // end resource spec
  depends_on = [kubernetes_namespace.nv-ns]
} // end cj resource