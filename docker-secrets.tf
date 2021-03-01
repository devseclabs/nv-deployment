#SECRET DOCKERHUB CONF
resource "kubernetes_secret" "dockerhub" {
  metadata {
    name = "regsecret"
    namespace = var.ns
  }

  data = {
    ".dockerconfigjson" = <<DOCKER
{
  "auths": {
    "${var.registry_server}": {
      "auth": "${base64encode("${var.registry_username}:${var.registry_password}")}"
    }
  }
}
DOCKER
  }

  type = "kubernetes.io/dockerconfigjson"
  depends_on = [kubernetes_namespace.nv-ns]
}