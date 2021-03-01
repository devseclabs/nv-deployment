# dockerhub settings
registry_username   = "my-docker-user"
registry_password   = "my-docker-pass"

#see provider.tf - k8s context configured in ~/-kube/config
context = "my-local-context"

#nv conf
manager_svc_type = "LoadBalancer"
scanner_replicas = 1
controller_replicas = 1
nv_version = "4.1.2"

#license data
license = "my-license-key"