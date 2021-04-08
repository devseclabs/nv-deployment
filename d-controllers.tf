locals {
  cm = var.enable_config == true ? false : true
}

resource "kubernetes_deployment" "neuvector-controller" {
  
  metadata {
    name = "neuvector-controller-pod"
    namespace = var.ns

  }

  spec {
    
    replicas = var.controller_replicas

    selector {
      match_labels = {
        app = "neuvector-controller-pod"
      }
    }

    min_ready_seconds = 60

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
          app = "neuvector-controller-pod"
        }
      }
      # TEMPLATE SPEC
      spec {
        
        affinity {
          pod_anti_affinity {
            preferred_during_scheduling_ignored_during_execution {
              weight = 100
              pod_affinity_term {
                label_selector {
                  match_expressions {
                    key = "app"
                    operator = "In"
                    values = [ "neuvector-controller-pod" ]

                  }
                }

                topology_key = "kubernetes.io/hostname"

              } // end affinity term

            } // end prefered-

          } // end anti-affinity

        } // end affinity
        
        image_pull_secrets {
          name  = "regsecret"
        }
        
        container {
          #TODO - CHANGE VERSION
          image = "neuvector/controller:${var.nv_version}"
          name  = "neuvector-controller-pod"

          security_context {
            privileged = true
          }
        
          readiness_probe {
            exec {
              command = [ "cat","/tmp/ready" ]
            }
            initial_delay_seconds = 5
            period_seconds = 5
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
            name = "nv-share"
            mount_path = "/var/neuvector"
            read_only = false
          }

          volume_mount {
            name = "config-volume"
            mount_path = "/etc/config"
            read_only = false
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
        
        } // end container
        
        termination_grace_period_seconds = 300
        restart_policy = "Always"

        #VOLUMES
        volume {
          name = "nv-share"
          host_path {
            path = "/var/neuvector"
          }
        }

        volume {
          name = "config-volume"
          config_map {
            name = "neuvector-init"
            optional = local.cm
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
  
  } // end resource spec
  depends_on = [kubernetes_namespace.nv-ns]

} // end resource