# UPDATER PARAMETERS VARS

variable "resource_name" {
  default = "neuvector-updater-pod"
}

variable "ns" {
  default = "neuvector" 
}

variable "test-ns" {
  default = "demo" 
}

variable "cron"{
    default = "0 0 * * *"
}

variable "docker_secret" {
    default = "regsecret"
    sensitive = true 
}

variable "image_name" {
    default = "neuvector/updater"
}

variable "enable_config" {
  default = false
}

variable "license" {
  sensitive = true
}

variable "commands" {
  default= ["/bin/sh", "-c", "TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`; /usr/bin/curl -kv -X PATCH -H \"Authorization:Bearer $TOKEN\" -H \"Content-Type:application/strategic-merge-patch+json\" -d '{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"kubectl.kubernetes.io/restartedAt\":\"'`date +%Y-%m-%dT%H:%M:%S%z`'\"}}}}}' 'https://kubernetes.default/apis/apps/v1/namespaces/neuvector/deployments/neuvector-scanner-pod'"]
}

# OTHERS VARS
# dockerhub conf
variable "registry_server" {
    default = "https://index.docker.io/v1/"
}

variable "registry_username" {
  sensitive = true
}
variable "registry_password" {
  sensitive = true
}

variable "pass" {
  default = "admin"
  sensitive = true
}

variable "nv_version" {
  default = "latest"
}

variable "controller_replicas" {
  default = 1
}

variable "scanner_replicas" {
  default = 1
}

variable "test_replicas" {
  default = 1
}

variable "manager_svc_type" {
  default = "LoadBalancer"
}

variable "context" {
  default = "my-context"
}