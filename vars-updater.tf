# UPDATER PARAMETERS VARS

variable "resource_name" {
  default = "neuvector-updater-pod"
}

variable "ns" {
  default = "neuvector" 
}

variable "cron"{
    default = "0 0 * * *"
}

variable "docker_secret" {
    default = "regsecret" 
}

variable "image_name" {
    default = "neuvector/updater"
}

variable "commands" {
  default= ["/bin/sh", "-c", "TOKEN=`cat /var/run/secrets/kubernetes.io/serviceaccount/token`; /usr/bin/curl -kv -X PATCH -H \"Authorization:Bearer $TOKEN\" -H \"Content-Type:application/strategic-merge-patch+json\" -d '{\"spec\":{\"template\":{\"metadata\":{\"annotations\":{\"kubectl.kubernetes.io/restartedAt\":\"'`date +%Y-%m-%dT%H:%M:%S%z`'\"}}}}}' 'https://kubernetes.default/apis/apps/v1/namespaces/neuvector/deployments/neuvector-scanner-pod'"]
}

# OTHERS VARS
# dockerhub conf
variable "registry_server" {
    default = "https://index.docker.io/v1/"
}

variable "registry_username" {}
variable "registry_password" {}

variable "nv_version" {
  default = "latest"
}

variable "controller_replicas" {
  default = 1
}

variable "scanner_replicas" {
  default = 1
}

variable "webui_svc_type" {
  default = "LoadBalancer"
}
