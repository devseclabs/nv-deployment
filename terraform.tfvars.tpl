# dockerhub settings
registry_username   = "FILL"
registry_password   = "FILL"

#provider - k8s context
context = "FILL"

#configmap
enable_config = true
#admin pass
pass = "NvSupport123"

#nv conf
manager_svc_type = "LoadBalancer"
scanner_replicas = 1
controller_replicas = 1
nv_version = "4.2.0"

#test pod replicas
test_replicas = 1
test-ns = "test"

#license data
license = ".license.txt"