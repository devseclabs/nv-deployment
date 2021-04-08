locals {
  license_file = file(var.license)
  eula_yaml = yamlencode({
    license_key = local.license_file
  })

  user_yaml = yamlencode({
    users = {
      - EMail = "achacon@neuvector.com"
        Fullname = "achacon"
        Locale  = "en"
        Password  = "a31415927"
        Role  = "reader"
        Timeout = 3600
      - Fullname = "admin"
        Password = var.pass
        Role  = "admin"
        Timeout = 3600
    }
  })
}

resource "kubernetes_config_map" "nv-conf" {
  metadata {
    name = "neuvector-init"
    namespace = var.ns
  }

  data = {
    
    #"eulainitcfg.yaml" = file("config/eula-data.txt")
    #"userinitcfg.yaml" = file("config/user-data.txt")
    # "eulainitcfg.yaml" = <<EOF
    # license_key: ${local.license_file}
    # EOF
    "eulainitcfg.yaml" = local.eula_yaml
    "userinitcfg.yaml" = local.user_yaml
    
  }
  depends_on = [kubernetes_namespace.nv-ns]
}