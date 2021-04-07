resource "kubernetes_config_map" "nv-conf" {
  metadata {
    name = "neuvector-init"
    namespace = var.ns
  }

  data = {
    
    #"eulainitcfg.yaml" = file("config/eula-data.txt")
    #"userinitcfg.yaml" = file("config/user-data.txt")
    "eulainitcfg.yaml" = <<EOF
    license_key: file(${var.license})
    EOF

    
  }
  depends_on = [kubernetes_namespace.nv-ns]
}