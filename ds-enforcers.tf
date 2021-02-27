resource "kubernetes_daemonset" "neuvector-enforcer" {
  metadata {
    name      = "neuvector-enforcer-pod"
    namespace = "neuvector"
  }

  spec {
    
    selector {
      match_labels = {
        app = "neuvector-enforcer-pod"
      }
    }
    
    strategy {
      type = "RollingUpdate"
    }

    template {
      
      metadata {
        labels = {
          app = "neuvector-enforcer-pod"
        }
      }

      spec {
        
        toleration {
          effect ="NoSchedule"
          key = "node-role.kubernetes.io/master"
        }
        
        image_pull_secrets {
          name  = "regsecret"
        }
        
        host_pid = true
        
        container {
          
          image = "neuvector/enforcer:${var.nv_version}"
          name  = "neuvector-enforcer-pod"

          security_context {
            privileged = true
            }

          #ENV VARS
          env {
            name  = "CLUSTER_JOIN_ADDR"
            value = "neuvector-svc-controller.neuvector"
           }

           env {
             name = "CLUSTER_ADVERTISED_ADDR"
             value_from {
               field_ref {
                  field_path = "status.podIP" 
               }
             }
           }

           env {
             name = "CLUSTER_BIND_ADDR"
             value_from {
               field_ref {
                  field_path = "status.podIP" 
               }
             }
           }
          

          #VOLUMES MOUNTS
          volume_mount {
            name = "modules-vol"
            mount_path = "/lib/modules"
            read_only = true
          }

          volume_mount {
            name = "docker-sock"
            mount_path = "/var/run/docker.sock"
            read_only = true
          }

          volume_mount {
            name = "proc-vol"
            mount_path = "/host/proc"
            read_only = true
          }

          volume_mount {
            name = "cgroup-vol"
            mount_path = "/host/cgroup"
            read_only = true
          }
        
          #initial_delay_seconds = 3
          #period_seconds        = 3
          
        } // end container

        termination_grace_period_seconds = 1200
        restart_policy = "Always"

        #VOLUMES
        volume {
          name = "modules-vol"
          host_path {
            path = "/lib/modules"
          }
        }

        volume {
          name = "docker-sock"
          host_path {
            path = "/var/run/docker.sock"
          }
        }

        volume {
          name = "proc-vol"
          host_path {
            path = "/proc"
          }
        }

        volume {
          name = "cgroup-vol"
          host_path {
            path = "/sys/fs/cgroup"
          }
        }

      } // end template spec

    } // end template 

  } //end resource spec

} // end ds resource